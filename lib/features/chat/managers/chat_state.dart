import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';
@freezed
 abstract class ChatState with _$ChatState {
  const factory ChatState({
     List<Map<String, dynamic>>? messages,
    bool? isConnecting,
     bool? isConnected,
    String? errorMessage,
  }) = _ChatState;

  factory ChatState.initial() =>  ChatState(
    messages: null,
    isConnected: false,
    isConnecting: false,
    errorMessage: null
  );
}
