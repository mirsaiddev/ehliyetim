import 'package:ehliyetim/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_app_bar.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

@override
void initState() {}

class _ProfilScreenState extends State<ProfilScreen> {
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
                                height: 500,
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
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                            child: Text(
                                          'Tema Seçiniz',
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff333333)),
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
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    print('themeProvider.themeMode is ${themeProvider.themeMode}');
    return Column(
      children: <Widget>[
        RadioListTile<ThemeMode>(
          title: Text('System'),
          value: ThemeMode.system,
          groupValue: themeProvider.themeMode,
          onChanged: (ThemeMode? value) {
            themeProvider.setThemeMode(value!);
          },
        ),
        RadioListTile<ThemeMode>(
          title: Text('Light'),
          value: ThemeMode.light,
          groupValue: themeProvider.themeMode,
          onChanged: (ThemeMode? value) {
            themeProvider.setThemeMode(value!);
          },
        ),
        RadioListTile<ThemeMode>(
          title: Text('Dark'),
          value: ThemeMode.dark,
          groupValue: themeProvider.themeMode,
          onChanged: (ThemeMode? value) {
            themeProvider.setThemeMode(value!);
          },
        ),
      ],
    );
  }
}
