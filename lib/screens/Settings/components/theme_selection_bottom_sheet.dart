import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/widgets/custom_cupertino_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class ThemeSelectionBottomSheet extends StatelessWidget {
  const ThemeSelectionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CustomCupertinoBottomSheet(
      leading: const SizedBox(width: 40),
      title: 'Test Sonucu',
      trailing: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.grey,
        ),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              RadioListTile<ThemeMode>(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                tileColor: Theme.of(context).colorScheme.onBackground,
                value: ThemeMode.system,
                activeColor: MyColors.purpleLight,
                groupValue: themeProvider.themeMode,
                onChanged: (theme) {
                  themeProvider.setThemeMode(theme!);
                  Navigator.pop(context);
                },
                title: Text('Sistem'),
              ),
              SizedBox(height: 10),
              RadioListTile<ThemeMode>(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                tileColor: Theme.of(context).colorScheme.onBackground,
                value: ThemeMode.light,
                activeColor: MyColors.purpleLight,
                groupValue: themeProvider.themeMode,
                onChanged: (theme) {
                  themeProvider.setThemeMode(theme!);
                  Navigator.pop(context);
                },
                title: Text('Açık Tema'),
              ),
              SizedBox(height: 10),
              RadioListTile<ThemeMode>(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                tileColor: Theme.of(context).colorScheme.onBackground,
                value: ThemeMode.dark,
                activeColor: MyColors.purpleLight,
                groupValue: themeProvider.themeMode,
                onChanged: (theme) {
                  themeProvider.setThemeMode(theme!);
                  Navigator.pop(context);
                },
                title: Text('Koyu Tema'),
              ),
            ],
          ),
        ),
      ),
      bottomLeading: const SizedBox(width: 40),
      bottomTrailing: const SizedBox(width: 40),
    );
  }
}
