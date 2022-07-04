import 'package:ehliyetim/providers/theme_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/widgets/custom_cupertino_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Ayarlar'),
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
