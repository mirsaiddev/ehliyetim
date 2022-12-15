import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/widgets/custom_cupertino_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
            const CustomAppBar(text: 'Ayarlar', backButton: true),
            const SizedBox(height: 10),
            // SettingsTile(text: 'Bildirim Ayarları', image: Assets.notification, onTap: () {}),
            SettingsTile(
                text: 'Gizlilik Politikası',
                image: Assets.privacy,
                onTap: () {
                  launchUrlString('https://pages.flycricket.io/ehliyetim/privacy.html');
                }),
            SettingsTile(
                text: 'Uygulama Teması',
                image: Assets.theme,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ThemeSelectionBottomSheet(),
                  );
                }),
            SettingsTile(
              text: 'Bize Ulaşın',
              image: Assets.contact,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ContactUsBottomSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsBottomSheet extends StatelessWidget {
  const ContactUsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoBottomSheet(
      leading: const SizedBox(width: 40),
      title: 'Bize Ulaşın',
      trailing: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.grey,
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            Lottie.network('https://assets7.lottiefiles.com/private_files/lf30_wbszjekz.json', height: 150),
            const Spacer(),
            Container(
              height: 60,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: MyColors.purpleLight),
              child: Row(
                children: const [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(width: 14),
                  Center(
                    child: Text(
                      'mirsaidik06@gmail.com',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomLeading: const SizedBox(width: 40),
      bottomTrailing: const SizedBox(width: 40),
    );
  }
}
