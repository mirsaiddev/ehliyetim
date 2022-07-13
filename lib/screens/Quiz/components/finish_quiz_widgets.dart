import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/utils/extensions/duration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_cupertino_bottom_sheet.dart';

class FinishQuizDialog extends StatelessWidget {
  const FinishQuizDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        child: Column(
          children: [
            Image.asset(Assets.warning),
            const Text(
              'Dikkat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const Text('Bu testi bitirmek istediğinize emin misiniz?'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: MyColors.green),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Devam Et',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: MyColors.red),
                    onPressed: () {
                      quizProvider.completeQuiz();
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        builder: (context) => FinishQuizBottomSheet(quizProvider: quizProvider),
                      );
                    },
                    child: const Text(
                      'Bitir',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FinishQuizBottomSheet extends StatelessWidget {
  const FinishQuizBottomSheet({
    Key? key,
    required this.quizProvider,
  }) : super(key: key);

  final QuizProvider quizProvider;

  @override
  Widget build(BuildContext context) {
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
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.book,
                        height: 24,
                        color: MyColors.purpleLight,
                      ),
                      const SizedBox(width: 10),
                      Center(
                        child: Text(
                          'Test Adı: ${quizProvider.quiz!.quizName}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    TestResultWidget(
                      text: 'Geçen Süre',
                      value: quizProvider.time.visualize(),
                      color: MyColors.purpleLight,
                      icon: Assets.clock,
                      image: Assets.pattern3,
                    ),
                    const SizedBox(width: 16),
                    TestResultWidget(
                      text: 'Toplam Soru Sayısı',
                      value: quizProvider.quiz!.questionObjects.length.toString(),
                      color: MyColors.orange,
                      icon: Assets.question2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    TestResultWidget(
                      text: 'Geçen Süre',
                      value: quizProvider.correctAnswers().toString(),
                      color: MyColors.green,
                      icon: Assets.checkO,
                      whiteIcon: false,
                    ),
                    const SizedBox(width: 16),
                    TestResultWidget(
                      text: 'Toplam Soru Sayısı',
                      value: quizProvider.wrongAnswers().toString(),
                      color: MyColors.red,
                      icon: Assets.removeO,
                      whiteIcon: false,
                    ),
                  ],
                ),
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

class TestResultWidget extends StatelessWidget {
  const TestResultWidget({
    Key? key,
    required this.text,
    required this.value,
    this.image = Assets.pattern2,
    required this.color,
    required this.icon,
    this.whiteIcon = true,
  }) : super(key: key);

  final String text;
  final String value;
  final String image;
  final String icon;
  final Color color;
  final bool whiteIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: AssetImage(image),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 22,
              color: whiteIcon ? Colors.white : null,
            ),
            Text(text, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
