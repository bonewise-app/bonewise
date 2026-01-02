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
  String? selected;

  final List<Map<String, String>> options = const [
    {'key': '0_1', 'label': AppStrings.ped_0_1},
    {'key': '1_3', 'label': AppStrings.ped_1_3},
    {'key': '4_10', 'label': AppStrings.ped_4_10},
    {'key': '11_18', 'label': AppStrings.ped_11_18},
    {'key': '18_30', 'label': AppStrings.age_18_30},
    {'key': '30_40', 'label': AppStrings.age_30_40},
    {'key': '40_60', 'label': AppStrings.age_40_60},
    {'key': '60_plus', 'label': AppStrings.age_60_plus},
  ];

  Future<void> _continue() async {
    final selectedOption =
    options.firstWhere((e) => e['key'] == selected);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_age_key', selectedOption['key']!);
    await prefs.setString('selected_age_label', selectedOption['label']!);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AgeDashboardScreen(
          ageKey: selectedOption['key']!,
          ageLabel: selectedOption['label']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 30,title: Text(AppStrings.selectAgeTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (_, index) {
                  final option = options[index];
                  final isSelected = selected == option['key'];

                  return GestureDetector(
                    onTap: () =>
                        setState(() => selected = option['key']),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? Colors.deepPurple
                              : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Text(option['label']!),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selected == null ? null : _continue,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: selected == null
                      ? Colors.grey.shade300
                      : Colors.deepPurple,
                ),
                child: Text(
                  AppStrings.continueText,
                  style: TextStyle(
                    color: selected == null
                        ? Colors.grey.shade600
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
