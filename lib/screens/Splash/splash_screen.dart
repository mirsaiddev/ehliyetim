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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Padding(padding: const EdgeInsets.all(30), child: Icon(Icons.car_rental)),
        ),
      ),
    );
  }
}
