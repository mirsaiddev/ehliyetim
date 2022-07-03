import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

enum AppTheme {
  light,
  dark,
  system,
}

@override
void initState() {}

class _ProfilScreenState extends State<ProfilScreen> {
  AppTheme? _appTheme = AppTheme.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Ayarlar'),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
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
                    trailing: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                        child: Container(
                                      height: 4,
                                      width: 36,
                                      margin: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffC4C4C4),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                            child: Text(
                                          'Tema Seçiniz',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff333333)),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Divider(),
                                    const SizedBox(height: 12),
                                    const SizedBox(height: 20),
                                    ThemeSelect(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(Icons.edit)),
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
              ]),
            )),
          ],
        ),
      ),
    );
  }
}

class ThemeSelect extends StatefulWidget {
  ThemeSelect({Key? key}) : super(key: key);

  @override
  State<ThemeSelect> createState() => _ThemeSelectState();
}

class _ThemeSelectState extends State<ThemeSelect> {
  AppTheme? _appTheme = AppTheme.light;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<AppTheme>(
          title: Text('Light'),
          value: AppTheme.light,
          groupValue: _appTheme,
          onChanged: (AppTheme? value) {
            setState(() {
              _appTheme = value;
            });
          },
        ),
        RadioListTile<AppTheme>(
          title: Text('Dark'),
          value: AppTheme.dark,
          groupValue: _appTheme,
          onChanged: (AppTheme? value) {
            setState(() {
              _appTheme = value;
            });
          },
        ),
        RadioListTile<AppTheme>(
          title: Text('System Theme'),
          value: AppTheme.system,
          groupValue: _appTheme,
          onChanged: (AppTheme? value) {
            setState(() {
              _appTheme = value;
            });
          },
        ),
      ],
    );
  }
}
