import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/ic_support.png',
                width: 54,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shoe Store', style: primaryTextStyle, maxLines: 1),
                    Text(
                      'Good evening, Mr. Harun. This item is currently unavailable',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: light,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(
                  fontSize: 10,
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1,
            color: Color(0xFF2B2939),
          )
        ],
      ),
    );
  }
}
