import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCupertinoBottomSheet extends StatefulWidget {
  const CustomCupertinoBottomSheet(
      {Key? key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.child,
      required this.bottomLeading,
      required this.bottomTrailing})
      : super(key: key);

  final Widget leading;
  final Widget bottomLeading;
  final Widget bottomTrailing;
  final Widget trailing;
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                  child: Container(
                height: 4,
                width: 36,
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyColors.greyLightest,
                  borderRadius: BorderRadius.circular(2),
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.leading,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        widget.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff333333)),
                      )),
                    ),
                    widget.trailing,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
