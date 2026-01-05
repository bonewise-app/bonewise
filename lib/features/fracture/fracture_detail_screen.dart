import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class FractureDetailScreen extends StatelessWidget {
  final String title;
  const FractureDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
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
              "Proper assessment helps identify the injury and reduces the risk of complications.",
            ),

            SizedBox(height: 16),
            Text(
              AppStrings.possibleOutcomeOfFracture,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "• Pain or stiffness may persist\n"
                  "• Temporary limitation of movement\n"
                  "• Healing may vary between individuals\n"
                  "• Follow-up care may be required",
            ),

            SizedBox(height: 16),
            Text(
              AppStrings.generalExpectations,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "Recovery experiences can vary depending on the fracture and individual factors.",
            ),

            SizedBox(height: 16),
            Text(
              "Red flags requiring urgent medical care",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              "• Severe pain\n• Visible deformity\n• Numbness\n• Inability to move the affected area",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
        child: Text(
          AppStrings.emergencyDisclaimer,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
