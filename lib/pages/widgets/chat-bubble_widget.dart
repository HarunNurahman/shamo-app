import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.text = '',
    this.isSender = false,
    this.hasProduct = false,
  });

  final String text;
  final bool isSender;
  final bool hasProduct;

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 240,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? bgColor5 : bgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? defaultRadius : 0),
            topRight: Radius.circular(isSender ? 0 : defaultRadius),
            bottomLeft: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset(
                    'assets/images/img_shoes-4.png',
                    width: 70,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Court Vision 2.0 Shoes'.toUpperCase(),
                        style: primaryTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '\$57.15',
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: primaryTextStyle.copyWith(color: primaryColor),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Buy Now',
                    style: primaryTextStyle.copyWith(
                      color: bgColor5,
                      fontWeight: medium,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : const SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSender ? bgColor5 : bgColor4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? defaultRadius : 0),
                      topRight: Radius.circular(isSender ? 0 : defaultRadius),
                      bottomLeft: Radius.circular(defaultRadius),
                      bottomRight: Radius.circular(defaultRadius),
                    ),
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                    textAlign: isSender ? TextAlign.right : TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
