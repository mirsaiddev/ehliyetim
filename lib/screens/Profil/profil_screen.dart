import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/widgets/premium_bottom_sheet.dart';
import 'package:ehliyetim/widgets/statistics_section.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/settings_tile.dart';
import '../Settings/settings_screen.dart';

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
            const CustomAppBar(text: 'Profilim'),
            const SizedBox(height: 30),
            SettingsTile(
              text: 'Ayarlar',
              image: Assets.settings,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
            ),
            SettingsTile(
                text: 'Premium Satın Al',
                image: Assets.payment,
                onTap: () {
                  showPremiumBottomSheet(context);
                }),
            SettingsTile(text: 'Bize Puan Ver', image: Assets.rating, onTap: () {}),
            SettingsTile(text: 'Uygulamayı Paylaş', image: Assets.share, onTap: () {}),
            const SizedBox(height: 24),
            const StatisticsSection(),
          ],
        ),
      ),
    );
  }
}
