import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_strings.dart';
import 'questionnaire_questions.dart';
import 'questionnaire_result_screen.dart';
import 'section_intro_screen.dart';

class QuestionnaireScreen extends StatefulWidget {
  final bool showFirstSectionIntro;

  const QuestionnaireScreen({super.key, this.showFirstSectionIntro = false});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int index = 0;
  int redFlags = 0;

  bool sectionIntroShown = false;

  @override
  void initState() {
    super.initState();
    restoreProgress();
  }

  Future<void> restoreProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      index = prefs.getInt('q_index') ?? 0;
      redFlags = prefs.getInt('q_red_flags') ?? 0;
    });

    if (widget.showFirstSectionIntro && index == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSectionIntro();
      });
    }
  }

  Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('q_index', index);
    await prefs.setInt('q_red_flags', redFlags);
  }

  QuestionSection currentSection() {
    return questionnaireSections.firstWhere((s) => index >= s.start && index <= s.end);
  }

  int currentSectionIndex() {
    return questionnaireSections.indexOf(currentSection());
  }

  void showSectionIntro() {
    final section = currentSection();
    sectionIntroShown = true;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SectionIntroScreen(sectionIndex: currentSectionIndex(), title: section.title,),
      ),
    );
  }

  void maybeShowSectionIntro() {
    final section = currentSection();

    if (index == section.start && !sectionIntroShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSectionIntro();
      });
    }
  }

  void answer(String value) async {
    final que = questions[index];

    if (que.isRedFlag && (value == AppStrings.yes || value == AppStrings.sometimes)) {
      redFlags++;
    }

    if (index == questions.length - 1) {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('q_index');
      prefs.remove('q_red_flags');

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
      setState(() {
        index++;
        sectionIntroShown = false;
      });
      await saveProgress();
      maybeShowSectionIntro();
    }
  }

  @override
  Widget build(BuildContext context) {
    final que = questions[index];
    final sectionIndex = currentSectionIndex();

    return WillPopScope(
      onWillPop: () async {
        if (index > 0) {
          setState(() {
            index--;
            sectionIntroShown = false;
          });
          await saveProgress();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: index == 0
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    setState(() {
                      index--;
                      sectionIntroShown = false;
                    });
                    await saveProgress();
                  },
                ),
          leadingWidth: 30,
          title: Text(
            "Section ${sectionIndex + 1} of 5",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120, child: Text(que.text, style: const TextStyle(fontSize: 16))),
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
