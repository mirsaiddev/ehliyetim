import 'package:flutter/material.dart';

import '../theme/colors.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: MyColors.purpleLight,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
