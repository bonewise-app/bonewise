import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class HowToUseBoneWiseScreen extends StatelessWidget {
  const HowToUseBoneWiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(AppStrings.howToUseTitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(AppStrings.howToUseTitleBoneWiseEducationalApp),
              SizedBox(height: 16),
              Text(AppStrings.boneWiseIsNOT, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.howToUseTitlePoints),
              SizedBox(height: 16),
              Text(AppStrings.boneWiseDoesNOT, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.howToUseBWNotPoints),
              SizedBox(height: 6),
              Text(AppStrings.usersAreAdvised),
              SizedBox(height: 16),
              Text(AppStrings.ageGroups, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.howToUseAgeBasedSections),
              SizedBox(height: 16),
              Text(AppStrings.modules, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.allAgeGroupsDisplay),
              SizedBox(height: 6),
              Text(AppStrings.howToUseModules),
              SizedBox(height: 16),
              Text(AppStrings.utilitiesSection, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.howToUseUtilitiesExist),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
        child: Text(AppStrings.globalUtilityFooter, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
