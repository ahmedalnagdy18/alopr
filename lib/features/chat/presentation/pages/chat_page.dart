import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/features/chat/presentation/widgets/avatar_widget.dart';
import 'package:alopr/features/chat/presentation/widgets/loading_chat_widget.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> _messages = [];
  final ChatUser _currentUser = ChatUser(id: 'user');
  final ChatUser _botUser = ChatUser(id: 'bot');
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendMessage(ChatMessage userMessage) async {
    setState(() {
      _messages.insert(0, userMessage);
      _isLoading = true;
    });

    // Simulate an API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Fixed bot response
    final botResponse = ChatMessage(
      user: _botUser,
      createdAt: DateTime.now(),
      text: "This is a test response",
    );

    setState(() {
      _messages.insert(0, botResponse);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.backgroundDark
        : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.primaryDark
            : AppColors.primaryLight,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Alopr Chat',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: DashChat(
            scrollToBottomOptions: ScrollToBottomOptions(
              scrollToBottomBuilder: (ScrollController scrollController) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white : Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: isDark ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            inputOptions: InputOptions(
              alwaysShowSend: true,
              textController: _textController,
              cursorStyle: CursorStyle(color: AppColors.primaryLight),
              sendButtonBuilder: (void Function() sendMessageCallback) {
                return ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _textController,
                  builder: (context, value, child) {
                    return IconButton(
                      icon: Icon(
                        Icons.send,
                        color: _textController.text.trim().isEmpty
                            ? Colors.grey
                            : AppColors.primaryLight,
                      ),
                      onPressed: _textController.text.trim().isEmpty
                          ? null
                          : sendMessageCallback,
                    );
                  },
                );
              },
            ),
            messageListOptions: MessageListOptions(
              showDateSeparator: rtl ? false : true,
              chatFooterBuilder: _isLoading ? LoadingChatWidget() : SizedBox(),
            ),
            messageOptions: MessageOptions(
              showTime: true,
              containerColor: Colors.grey.shade200,
              currentUserContainerColor: AppColors.primaryLight,
              timeFontSize: 10,
              timeTextColor: Colors.grey.shade700,
              avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) {
                return AvatarWidget();
              },
            ),
            currentUser: _currentUser,
            onSend: (ChatMessage message) {
              if (_textController.text.trim().isNotEmpty) {
                _sendMessage(message);
              }
            },
            messages: _messages,
          ),
        ),
      ),
    );
  }
}
