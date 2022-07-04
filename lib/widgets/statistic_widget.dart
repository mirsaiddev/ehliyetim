import 'package:flutter/material.dart';

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.value,
  }) : super(key: key);

  final String text;
  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: 26),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
