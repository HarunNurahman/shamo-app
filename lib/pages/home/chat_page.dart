import 'package:flutter/material.dart';
import 'package:shamo/pages/widgets/chat_tile.dart';
import 'package:shamo/themes.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // Header Widget / App Bar
  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    );
  }

  // No Chat Available Widget
  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/ic_chat-404.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'Oops no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You\'ve never done any transaction',
              style: secondaryTextStyle,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 24,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Chat List
  Widget listChat() {
    return Expanded(
      child: Container(
        color: bgColor3,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: const [
            ChatTile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Column(
        children: [
          header(),
          // emptyChat(),
          listChat()
        ],
      ),
    );
  }
}
