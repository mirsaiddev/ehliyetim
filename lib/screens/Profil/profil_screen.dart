import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/widgets/premium_bottom_sheet.dart';
import 'package:ehliyetim/widgets/statistics_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
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
            if (!splashProvider.isPremium)
              SettingsTile(
                  text: 'Premium Satın Al',
                  image: Assets.payment,
                  onTap: () {
                    showPremiumBottomSheet(context);
                  }),
            SettingsTile(
                text: 'Bize Puan Ver',
                image: Assets.rating,
                onTap: () {
                  launchUrlString('https://play.google.com/store/apps/details?id=com.ehliyetim.ehliyetsinavsorulari');
                }),
            SettingsTile(
                text: 'Uygulamayı Paylaş',
                image: Assets.share,
                onTap: () {
                  Share.share('https://play.google.com/store/apps/details?id=com.ehliyetim.ehliyetsinavsorulari');
                }),
            const SizedBox(height: 24),
            const StatisticsSection(),
          ],
        ),
      ),
    );
  }
}
