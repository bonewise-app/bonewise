import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class SimpleExplanationsScreen extends StatelessWidget {
  const SimpleExplanationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      AppStrings.boneDef,
      AppStrings.fractureDef,
      AppStrings.displaced,
      AppStrings.nonDisplaced,
      AppStrings.hairlineFracture,
      AppStrings.softTissue,
      AppStrings.ligament,
      AppStrings.joint,
      AppStrings.boneDensity,
    ];

    final itemsDescriptions = [
      AppStrings.boneDefDesc,
      AppStrings.fractureDefDesc,
      AppStrings.displacedDesc,
      AppStrings.nonDisplacedDesc,
      AppStrings.hairlineFractureDesc,
      AppStrings.softTissueDesc,
      AppStrings.ligamentDesc,
      AppStrings.jointDesc,
      AppStrings.boneDensityDesc,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(
          AppStrings.simpleExplanationsTitle,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(AppStrings.purpose, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.explainCommonBone),
              SizedBox(height: 16),
              ...List.generate(items.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index], style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 6),
                    Text(itemsDescriptions[index]),
                    SizedBox(height: 16),
                  ],
                );
              }),
              Text(AppStrings.importantNote, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text(AppStrings.theseExplanationsDescribe),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
        child: Text(AppStrings.medicalTermsFooter, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
