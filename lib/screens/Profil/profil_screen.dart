import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

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
                          //_customShowModalBottomSheet(context);
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

  /* Future<void> _customShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'asd',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff333333)),
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RadioListTile<AppTheme>(
          title: const Text('Lafayette'),
          
          groupValue: _character,
          onChanged: (AppTheme? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<AppTheme>(
          title: const Text('Thomas Jefferson'),
          value: AppTheme.jefferson,
          groupValue: _character,
          onChanged: (AppTheme? value) {
            setState(() {
              _character = value;
            });
          },
        ),
            ],
          ),
        );
      },
    );
  }
}

enum AppTheme { dark, light, system }

class CustomCupertinoBottomSheet extends StatefulWidget {
  const CustomCupertinoBottomSheet(
      {Key? key,
      required this.title,
      required this.child,
      required this.bottomLeading,
      required this.bottomTrailing})
      : super(key: key);

  final Widget bottomLeading;
  final Widget bottomTrailing;
  final String title;
  final Widget child;

  @override
  State<CustomCupertinoBottomSheet> createState() => _CustomCupertinoBottomSheetState();
}

class _CustomCupertinoBottomSheetState extends State<CustomCupertinoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(26),
      child: SafeArea(
        top: false,
        child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff333333)),
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 12),
              widget.child,
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [widget.bottomLeading, widget.bottomTrailing],
                  ),
                ),
              ),
              //const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}*/
}
