import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/months.dart';
import '../../../../widgets/custom_app_bar.dart';

class MonthScreen extends StatelessWidget {
  const MonthScreen({Key? key, required this.year, required this.month}) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustomAppBar(text: '${months[month - 1]} ${year}'),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: daysPerMonth[month - 1],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${index + 1} ${months[month - 1]} ${year}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.purpleLight,
                          size: 18,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
