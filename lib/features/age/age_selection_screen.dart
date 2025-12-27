import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'age_dashboard_screen.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  String? selectedAgeKey;
  String? selectedAgeLabel;

  final List<Map<String, String>> ageGroups = const [
    {'key': 'infant', 'label': 'Infant (0–1)'},
    {'key': 'toddler', 'label': 'Toddler (1–3)'},
    {'key': 'child', 'label': 'Child (4–10)'},
    {'key': 'adolescent', 'label': 'Adolescent (10–19)'},
    {'key': 'early_adult', 'label': 'Early Adult (20–40)'},
    {'key': 'late_adult', 'label': 'Late Adult (40–60)'},
    {'key': 'elderly', 'label': 'Elderly (60+)'},
  ];

  Future<void> _continue() async {
    if (selectedAgeKey == null || selectedAgeLabel == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_age_key', selectedAgeKey!);
    await prefs.setString('selected_age_label', selectedAgeLabel!);

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AgeDashboardScreen(ageKey: selectedAgeKey!, ageLabel: selectedAgeLabel!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Age Group',style: TextStyle(fontWeight: FontWeight.w500),)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: ageGroups.length,
                itemBuilder: (context, index) {
                  final group = ageGroups[index];
                  final isSelected = selectedAgeKey == group['key'];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedAgeKey = group['key'];
                          selectedAgeLabel = group['label'];
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(group['label']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedAgeKey == null ? null : _continue,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: selectedAgeKey == null ? Colors.grey.shade50 : Colors.deepPurple,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: (selectedAgeKey == null) ? Colors.grey.shade500 : Colors.white),
                ),
              ),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
