import 'package:flutter/material.dart';

import '../utils/constants/assets.dart';
import 'custom_cupertino_bottom_sheet.dart';

Future<dynamic> showPremiumBottomSheet(BuildContext context, {bool isAgain = false}) {
  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) => PremiumBottomSheet(isAgain: isAgain),
  );
}

class PremiumBottomSheet extends StatelessWidget {
  const PremiumBottomSheet({
    Key? key,
    required this.isAgain,
  }) : super(key: key);

  final bool isAgain;

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoBottomSheet(
      leading: const SizedBox(width: 40),
      title: 'Premium Satın Al',
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
            Image.asset(Assets.premium, height: 80),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Tüm içeriklere erişebilmek ve reklamları kaldırmak için Premium satın almanız gerekmektedir.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            if (isAgain)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Çözülen testi tekrar çözebilmek ve öğrenilen konuyu tekrar okumak için Premium olmalısınız.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '+60.000 soru, +1.200 test ve +35 konu anlatımına erişin.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Premium Satın Al',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomLeading: const SizedBox(width: 40),
      bottomTrailing: const SizedBox(width: 40),
    );
  }
}
