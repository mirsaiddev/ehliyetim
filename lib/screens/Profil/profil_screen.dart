import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            child: ListTile(
              title: Text('Bildirim Ayarları'),
              leading: Icon(Icons.ad_units),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Gizlilik Politikası'),
              leading: Icon(Icons.ad_units),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Karanlık Mod'),
              leading: Icon(Icons.ad_units),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Bize Ulaşın'),
              leading: Icon(Icons.ad_units),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Çıkış Yap'),
              leading: Icon(Icons.ad_units),
            ),
          ),
        ],
      ),
    );
  }
}
