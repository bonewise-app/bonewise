import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class VisualGuidesScreen extends StatelessWidget {
  const VisualGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(AppStrings.visualGuides, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              visualSection(title: AppStrings.basicBoneAnatomy),
              visualSection(title: AppStrings.commonFractureLocations),
              visualSection(title: AppStrings.fractureCanHappen),
              visualSection(title: AppStrings.boneSoftTissue),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
        child: Text(AppStrings.visualFooter, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}

Widget visualSection({required String title, String? image}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(height: 6),
      Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      SizedBox(height: 16),
    ],
  );
}
