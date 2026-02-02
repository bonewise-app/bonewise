import 'package:flutter/material.dart';
import '../../app_strings.dart';

class SectionIntroScreen extends StatelessWidget {
  final int sectionIndex;
  final String title;

  const SectionIntroScreen({super.key, required this.sectionIndex, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          "Section ${sectionIndex + 1} of 5",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(AppStrings.continueText, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
