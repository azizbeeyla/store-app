import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/chat/managers/chat_bloc.dart';
import 'package:store_app/features/chat/managers/chat_state.dart';
import 'package:store_app/features/chat/widgets/chat_input_bar.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';

import '../managers/chat_event.dart';
import '../widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isScrolling = false;

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomAppBarMain(title: "Customer Service"),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.idle) {
                if (isScrolling) setState(() => isScrolling = false);
              } else {
                if (!isScrolling) setState(() => isScrolling = true);
              }
              return false;
            },
            child: ChatMessageList(
              messages: state.messages ?? [],
              scrollController: scrollController,
            ),
          ),
          bottomNavigationBar: ChatInputBar(
            controller: controller,
            isScrolling: isScrolling,
            onSend: (text) {
              if (text.trim().isEmpty) return;
              context.read<ChatBloc>().add( ChatMessageSend(message: text.trim()));
              controller.clear();
              _scrollToBottom();
            },
          ),
        );
      },
    );
  }
}
