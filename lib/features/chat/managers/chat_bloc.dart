import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvents, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<ChatConnect>(_onConnect);
    on<ChatDisconnect>(_onDisconnect);
    on<ChatMessageSend>(_onMessageSend);
    on<ChatMessageReceived>(_onMessageReceived);

    add(ChatConnect());
  }

  late WebSocketChannel _socket;
  StreamSubscription? _subscription;

  ///  WebSocketga ulanish
  Future<void> _onConnect(ChatConnect event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isConnecting: true));

    try {
      final uri = Uri.parse("ws://192.168.10.191:8888/chat");
      _socket = WebSocketChannel.connect(uri);

      _subscription = _socket.stream.listen(
            (data) {
          final decoded = jsonDecode(data);
          add(ChatMessageReceived(message: decoded));
        },
        onError: (error) {
          emit(state.copyWith(errorMessage: error.toString()));
        },
        onDone: () {
          emit(state.copyWith(isConnected: false));
        },
      );

      emit(state.copyWith(isConnecting: false, isConnected: true));
    } catch (e) {
      emit(state.copyWith(
        isConnecting: false,
        isConnected: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDisconnect(
      ChatDisconnect event, Emitter<ChatState> emit) async {
    await _subscription?.cancel();
    await _socket.sink.close(ws_status.normalClosure);
    emit(state.copyWith(isConnected: false));
  }

  Future _onMessageReceived(
      ChatMessageReceived event,
      Emitter<ChatState> emit,
      ) async {
    final updated = List<Map<String, dynamic>>.from(state.messages ?? [])
      ..add(event.message);
    emit(state.copyWith(messages: updated));
  }

  Future _onMessageSend(ChatMessageSend event, Emitter<ChatState> emit) async {
    final message = {
      "message": event.message,
      "direction": "from",
      "date": DateTime.now().toLocal().toIso8601String(),
    };
    debugPrint("➡️ Sending to backend: $message"); //

    _socket.sink.add(jsonEncode(message));

    final updated = List<Map<String, dynamic>>.from(state.messages ?? [])
      ..add(message);
    emit(state.copyWith(messages: updated));
  }


  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _socket.sink.close(ws_status.normalClosure);
    return super.close();
  }
}
