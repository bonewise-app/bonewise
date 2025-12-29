import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_strings.dart';
import 'age_dashboard_screen.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  String? selectedKey;
  String? selectedLabel;

  String extractAgeRange(String label) {
    return label.split('(').first.trim();
  }

  final List<Map<String, String>> ageGroups = const [
    {'key': '0_1', 'label': AppStrings.age_0_1},
    {'key': '1_3', 'label': AppStrings.age_1_3},
    {'key': '4_10', 'label': AppStrings.age_4_10},
    {'key': '10_17', 'label': AppStrings.age_10_17},
    {'key': '18_30', 'label': AppStrings.age_18_30},
    {'key': '30_40', 'label': AppStrings.age_30_40},
    {'key': '40_60', 'label': AppStrings.age_40_60},
    {'key': '60_plus', 'label': AppStrings.age_60_plus},
  ];

  Future<void> _continue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_age_key', selectedKey!);
    await prefs.setString('selected_age_label', selectedLabel!);

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AgeDashboardScreen(ageKey: selectedKey!, ageLabel: extractAgeRange(selectedLabel!)),
      ),
    );
  }

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
                itemCount: ageGroups.length,
                itemBuilder: (context, index) {
                  final group = ageGroups[index];
                  final selected = selectedKey == group['key'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedKey = group['key'];
                        selectedLabel = group['label'];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: selected ? Colors.deepPurple : Colors.grey, width: selected ? 2 : 1),
                      ),
                      child: Text(group['label']!, style: const TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedKey == null ? null : _continue,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: selectedKey == null ? Colors.grey.shade50 : Colors.deepPurple,
                ),
                child: Text(
                  AppStrings.continueText,
                  style: TextStyle(color: (selectedKey == null) ? Colors.grey.shade500 : Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
