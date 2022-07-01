import 'package:ehliyetim/screens/Questions/SubScreens/Month/month_screen.dart';
import 'package:flutter/material.dart';

class YearScreen extends StatelessWidget {
  const YearScreen({Key? key, required this.year}) : super(key: key);

  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$year Ehliyet Sınavı Soruları'),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MonthScreen(year: year, month: index + 1),
                  ),
                );
              },
              title: Text('Ocak Ayı Soruları'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        }),
      ),
    );
  }
}
