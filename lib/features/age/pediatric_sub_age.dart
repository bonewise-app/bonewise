import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/age/age_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PediatricAgeSelectionScreen extends StatefulWidget {
  const PediatricAgeSelectionScreen({super.key});

  @override
  State<PediatricAgeSelectionScreen> createState() => _PediatricAgeSelectionScreenState();
}

class _PediatricAgeSelectionScreenState extends State<PediatricAgeSelectionScreen> {
  String? selectedKey;

  final List<Map<String, String>> pediatricAges = const [
    {'key': '0_1', 'label': AppStrings.ped_0_1},
    {'key': '1_3', 'label': AppStrings.ped_1_3},
    {'key': '4_10', 'label': AppStrings.ped_4_10},
    {'key': '10_17', 'label': AppStrings.ped_11_18},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.selectAgeTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pediatricAges.length,
                itemBuilder: (_, i) {
                  final item = pediatricAges[i];
                  final isSelected = selectedKey == item['key'];

                  return GestureDetector(
                    onTap: () => setState(() => selectedKey = item['key']),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.deepPurple : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(item['label']!),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedKey == null ? null : () async {
                  final selectedAge = pediatricAges.firstWhere((e) => e['key'] == selectedKey);
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('selected_age_key', selectedAge['key']!);
                  await prefs.setString('selected_age_label', selectedAge['label']!);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AgeDashboardScreen(ageKey: selectedAge['key']!, ageLabel: selectedAge['label']!),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: selectedKey == null
                      ? Colors.grey.shade300
                      : Colors.deepPurple,
                ),
                child: Text(
                  AppStrings.continueText,
                  style: TextStyle(
                    color: selectedKey == null
                        ? Colors.grey.shade600
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
