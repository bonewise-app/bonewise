import 'package:flutter/material.dart';
import '../../app_strings.dart';

class AgeDashboardScreen extends StatelessWidget {
  final String ageKey;
  final String ageLabel;

  const AgeDashboardScreen({
    super.key,
    required this.ageKey,
    required this.ageLabel,
  });

  bool get isPediatric =>
      ageKey == '0_1' ||
          ageKey == '1_3' ||
          ageKey == '4_10' ||
          ageKey == '10_17';

  List<Map<String, String>> getModules() {
    if (ageKey == '0_1' || ageKey == '1_3') {
      return [
        {'key': 'nutrition', 'label': AppStrings.nutrition},
      ];
    }

    if (ageKey == '4_10') {
      return [
        {'key': 'nutrition', 'label': AppStrings.nutrition},
        {'key': 'bone', 'label': AppStrings.boneHealth},
      ];
    }

    if (ageKey == '10_17') {
      return [
        {'key': 'bone', 'label': AppStrings.boneHealth},
        {'key': 'exercise', 'label': AppStrings.exercise},
      ];
    }

    if (ageKey == '18_30') {
      return [
        {'key': 'exercise', 'label': AppStrings.exercise},
        {'key': 'nutrition', 'label': AppStrings.nutrition},
      ];
    }

    if (ageKey == '30_40' || ageKey == '40_60') {
      return [
        {'key': 'exercise', 'label': AppStrings.exercise},
        {'key': 'bone', 'label': AppStrings.boneHealth},
      ];
    }

    if (ageKey == '60_plus') {
      return [
        {'key': 'exercise', 'label': AppStrings.exercise},
        {'key': 'fracture', 'label': AppStrings.fractureEducation},
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
        title: Text(
          ageLabel,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(
              AppStrings.globalDisclaimer,
              style: const TextStyle(fontSize: 13),
            ),
            if (isPediatric) ...[
              const SizedBox(height: 16),
              Text(
                AppStrings.pediatricDisclaimer,
                style: const TextStyle(fontSize: 13),
              ),
            ],
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final module = modules[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    child: Text(
                      module['label']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
