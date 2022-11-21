import 'package:flutter/material.dart';
import 'package:shamo/themes.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.textStyle,
    required this.background,
    required this.border,
  });

  final String category;
  final TextStyle textStyle;
  final Color background;
  final Color border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(color: border),
      ),
      child: Text(category, style: textStyle),
    );
  }
}
