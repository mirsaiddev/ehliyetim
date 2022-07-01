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
        /* body: ListView.builder(
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
      ),*/
        /*   body: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          ListView.builder(
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
          ListView.builder(
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
        ],
      ),*/
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0),
          itemCount: 12,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                width: 183,
                height: 65,
                child: Card(
                  child: ListTile(
                    onTap: () {
                      /*    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonthScreen(year: year, month: index + 1),
                        ),
                      );*/
                    },
                    title: Text('1 Ocak 2022'),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Color(0xff6235BC), size: 20),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
