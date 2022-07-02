import 'package:flutter/material.dart';

import 'SubScreens/Year/year_screen.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              //APP BAR
              child: Container(
                alignment: Alignment.center,
                height: 63,
                width: 338,
                child: AppBar(
                  backgroundColor: Color(0xff1E1431),
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                    side: BorderSide(color: Colors.transparent, width: 20),
                  ),
                  title: Text('Kategoriler'),
                ),
              ),
            ),
            /* Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  shape: BoxShape.circle,
                  color: Color(0xff1E1431),
                ),
                height: 63,
                width: 338,
                child: Text(
                  'Kategoriler',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(right: 80, top: 20),
              child: Text(
                '2022',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 183,
              height: 65,
              child: Card(
                child: ListTile(
                  //leading: Image.asset('name'),
                  title: Text(
                    'Ocak 2022 Ehliyet \n Sınav sorularu',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 80, top: 20),
              child: Text(
                '2021',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 183,
              height: 65,
              child: Card(
                child: ListTile(
                  //leading: Image.asset('name'),
                  title: Text(
                    'Ocak 2021 Ehliyet \n Sınav sorularu',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 80, top: 20),
              child: Text(
                '2020',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 183,
              height: 65,
              child: Card(
                child: ListTile(
                  //leading: Image.asset('name'),
                  title: Text(
                    'Ocak 2020 Ehliyet \n Sınav sorularu',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, top: 30),
              child: Text(
                '2014-2022',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 400,
              height: 65,
              child: Card(
                child: ListTile(
                  title: Text(
                    '24 Ocak 2022 Ehliyet Sınavı Soruları',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              height: 65,
              child: Card(
                child: ListTile(
                  title: Text(
                    '24 Ocak 2022 Ehliyet Sınavı Soruları',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              height: 65,
              child: Card(
                child: ListTile(
                  title: Text(
                    '24 Ocak 2022 Ehliyet Sınavı Soruları',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              height: 65,
              child: Card(
                child: ListTile(
                  title: Text(
                    '24 Ocak 2022 Ehliyet Sınavı Soruları',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              height: 65,
              child: Card(
                child: ListTile(
                  title: Text(
                    '24 Ocak 2022 Ehliyet Sınavı Soruları',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xff6235BC), size: 20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YearScreen(year: 2020)));
                  },
                ),
              ),
            ),
            /*Card(
                  child: ListTile(
                title: Text('2021'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YearScreen(year: 2021)));
                },
              ),)*/
          ],
        ),
      ),
    );
  }
}
