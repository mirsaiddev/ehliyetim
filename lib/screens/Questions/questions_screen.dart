import 'package:ehliyetim/screens/Questions/SubScreens/Year/year_screen.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
      ),
      body: Column(
        children: [
          Card(
              child: ListTile(
            title: Text('2021'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YearScreen(year: 2021)));
            },
          ))
        ],
      ),
    );
  }
}
