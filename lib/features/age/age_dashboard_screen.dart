import 'package:flutter/material.dart';

class AgeDashboardScreen extends StatelessWidget {
  final String ageKey;
  final String ageLabel;

  const AgeDashboardScreen({super.key, required this.ageKey, required this.ageLabel});

  List<Map<String, String>> getModules() {
    if (ageKey == 'infant' || ageKey == 'toddler') {
      return [
        {'key': 'nutrition', 'label': 'Nutrition'},
      ];
    }

    if (ageKey == 'child') {
      return [
        {'key': 'nutrition', 'label': 'Nutrition'},
        {'key': 'bone', 'label': 'Bone Health'},
      ];
    }

    if (ageKey == 'adolescent') {
      return [
        {'key': 'bone', 'label': 'Bone Health'},
        {'key': 'exercise', 'label': 'Exercise'},
      ];
    }

    if (ageKey == 'early_adult') {
      return [
        {'key': 'exercise', 'label': 'Exercise'},
        {'key': 'nutrition', 'label': 'Nutrition'},
      ];
    }

    if (ageKey == 'late_adult') {
      return [
        {'key': 'exercise', 'label': 'Exercise'},
        {'key': 'bone', 'label': 'Bone Health'},
      ];
    }

    if (ageKey == 'elderly') {
      return [
        {'key': 'exercise', 'label': 'Exercise'},
        {'key': 'fracture', 'label': 'Fracture Education'},
      ];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final modules = getModules();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(ageLabel, style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                        color: Colors.white,
                      ),
                      child: Text(module['label']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
