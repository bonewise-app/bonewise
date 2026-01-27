import 'package:flutter/material.dart';
import '../../app_strings.dart';
import 'questionnaire_questions.dart';
import 'questionnaire_result_screen.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int index = 0;
  int redFlags = 0;

  void answer(String value) {
    final que = questions[index];

    if (que.isRedFlag && (value == AppStrings.yes || value == AppStrings.sometimes)) {
      redFlags++;
    }

    if (index == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuestionnaireResultScreen(
            category: redFlags >= 3
                ? 3
                : redFlags == 0
                ? 1
                : 2,
          ),
        ),
      );
    } else {
      setState(() => index++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final que = questions[index];
    return WillPopScope(
      onWillPop: () async {
        if (index > 0) {
          setState(() => index--);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 30,
          leading: index == 0
              ? null
              : IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => setState(() => index--)),
          title: Text("${AppStrings.question} ${index + 1}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120,
                  child:Text(que.text, style: const TextStyle(fontSize: 16))),
              ...[AppStrings.yes, AppStrings.no, AppStrings.notSure, if (que.allowSometimes) AppStrings.sometimes].map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () => answer(a),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      ),
                      child: Text(a, textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
