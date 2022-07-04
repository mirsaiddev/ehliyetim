import 'package:ehliyetim/screens/TopicsList/topics_list.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TopicsListWidget extends StatelessWidget {
  const TopicsListWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.topicKey,
  }) : super(key: key);

  final String text;
  final String image;
  final String topicKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicsList(topicKey: topicKey)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: -20,
              child: Transform.rotate(
                angle: -math.pi / 8,
                child: Image.asset(
                  image,
                  height: 80,
                  scale: 0.4,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            Container(
              height: 94,
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(image, height: 40, color: MyColors.purpleLight),
                  SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
