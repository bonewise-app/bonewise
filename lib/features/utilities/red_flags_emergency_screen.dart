import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class RedFlagsEmergencyScreen extends StatelessWidget {
  const RedFlagsEmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      AppStrings.severe,
      AppStrings.visible,
      AppStrings.inabilityToMove,
      AppStrings.numbness,
      AppStrings.openWounds,
      AppStrings.majorInjury,
    ];

    final itemsDescriptions = [
      AppStrings.severeDes,
      AppStrings.visibleDes,
      AppStrings.inabilityToMoveDes,
      AppStrings.numbnessDes,
      AppStrings.openWoundsDes,
      AppStrings.majorInjuryDes,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(AppStrings.redFlagsTitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(AppStrings.redFlagsPoints),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
        child: Text(AppStrings.emergencyFooter, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
