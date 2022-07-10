import 'package:flutter/material.dart';
import '../../utils/constants/assets.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/settings_tile.dart';
import 'components/theme_selection_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

@override
void initState() {}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Ayarlar', backButton: true),
            SizedBox(height: 10),
            SettingsTile(text: 'Bildirim Ayarları', image: Assets.notification, onTap: () {}),
            SettingsTile(text: 'Gizlilik Politikası', image: Assets.privacy, onTap: () {}),
            SettingsTile(
                text: 'Uygulama Teması',
                image: Assets.theme,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) => ThemeSelectionBottomSheet(),
                  );
                }),
            SettingsTile(text: 'Bize Ulaşın', image: Assets.contact, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
