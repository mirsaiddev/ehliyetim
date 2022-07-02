import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/constants/months.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    Key? key,
    required this.month,
    required this.year,
    required this.day,
    this.onTap,
  }) : super(key: key);

  final int month;
  final int year;
  final int day;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$day ${months[month - 1]} $year',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
