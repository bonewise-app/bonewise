import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class NutritionBoneHealthScreen extends StatelessWidget {
  final int pageIndex;

  NutritionBoneHealthScreen({super.key, required this.pageIndex});

  final List<Map<String, String>> pages = [
    {
      'title': AppStrings.whyNutritionMatters,
      'content': "Nutrition plays an essential role in maintaining healthy bones throughout life.",
    },
    {
      'title': AppStrings.calciumBones,
      'content': "Calcium supports bone structure and strength and is an important part of bone health.",
    },
    {
      'title': AppStrings.vitaminDBones,
      'content': "Vitamin D helps the body absorb calcium effectively and supports bone health.",
    },
    {
      'title': AppStrings.foodsForBones,
      'content': "A balanced diet with a variety of foods contributes to overall bone health.",
    },
    {
      'title': AppStrings.nutritionMyths,
      'content': "Many common beliefs about bone nutrition are not supported by evidence.",
    },
    {
      'title': AppStrings.consultDoctor,
      'content': "Certain symptoms or health concerns may require medical consultation.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final page = pages[pageIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: Text(page['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(page['content'] ?? '')
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
        child: Text(
          AppStrings.mediumDisc,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
