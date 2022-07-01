import 'package:flutter/material.dart';

class MonthScreen extends StatelessWidget {
  const MonthScreen({Key? key, required this.year, required this.month}) : super(key: key);
  final int year, month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ocak Ayı Soruları'),
      ),
      body: ListView.builder(
        itemCount: 30,
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
              title: Text('${index + 1} Ocak'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        }),
      ),
    );
  }
}
