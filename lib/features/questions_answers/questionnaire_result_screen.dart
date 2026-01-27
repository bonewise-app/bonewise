import 'package:flutter/material.dart';
import '../../app_strings.dart';

class QuestionnaireResultScreen extends StatelessWidget {
  final int category;

  const QuestionnaireResultScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final text = category == 1
        ? AppStrings.result1
        : category == 2
        ? AppStrings.result2
        : AppStrings.result3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30,
        title: Text(AppStrings.result, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Text(text)),
            const SizedBox(height: 12),
            Spacer(),
            const Text(
              AppStrings.resultFooter,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
