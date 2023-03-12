import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt_app/constants/constants.dart';
import 'package:chat_gpt_app/services/assets_manager.dart';
import 'package:chat_gpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
        required this.message,
        required this.chatIndex,
        this.shouldAnimate = false});

  final String message;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    final chatIndexIsUser = chatIndex == 0;
    return Column(
      children: [
        Material(
          color: chatIndexIsUser ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: chatIndexIsUser ? TextDirection.rtl : TextDirection.ltr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    chatIndexIsUser
                        ? AssetsManager.userImage
                        : AssetsManager.botImage,
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: chatIndexIsUser
                        ? TextWidget(
                      label: message,
                    )
                        : shouldAnimate
                        ? DefaultTextStyle(
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText(
                              message.trim(),
                            ),
                          ]),
                    )
                        : Text(
                      message.trim(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 15,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}