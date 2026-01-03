import 'package:flutter/material.dart';
import '../../app_strings.dart';

class FractureDetailScreen extends StatelessWidget {
  final String title;
  const FractureDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leadingWidth: 30,title: Text(title,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Text(
              AppStrings.whatThisFractureMeans,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "This fracture refers to a break or crack in the bone located in this area of the body.",
            ),

            SizedBox(height: 16),
            Text(
              AppStrings.howItCommonlyHappens,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text("• Falls\n• Direct impact\n• Accidental injury"),

            SizedBox(height: 16),
            Text(
              AppStrings.commonSymptomsPeopleNotice,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "• Pain\n• Swelling\n• Bruising\n• Difficulty moving\n• Tenderness",
            ),

            SizedBox(height: 16),
            Text(
              AppStrings.whyMedicalEvaluationIsImportant,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "Proper assessment helps identify the injury and prevents complications.",
            ),

            SizedBox(height: 16),
            Text(
              AppStrings.urgentMedicalCare,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "• Severe pain\n• Deformity\n• Numbness\n• Inability to move the limb",
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          AppStrings.emergencyDisclaimer,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
