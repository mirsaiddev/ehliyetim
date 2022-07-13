import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    splashProvider.init(context);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                  'lib/assets/images/logo_color.png',
                  height: 150,
                )),
          ),
        ),
      ),
    );
  }
}
