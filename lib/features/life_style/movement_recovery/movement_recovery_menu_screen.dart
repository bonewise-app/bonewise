import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';
import 'movement_recovery_screen.dart';

class MovementRecoveryMenuScreen extends StatelessWidget {
  const MovementRecoveryMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      AppStrings.whyMovementMatters,
      AppStrings.earlyRecoveryUnderstanding,
      AppStrings.returningToDailyActivities,
      AppStrings.confidenceAndFear,
      AppStrings.longTermBoneCare,
      AppStrings.safetyAndRedFlags,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: const Text(AppStrings.movementRecovery, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MovementRecoveryScreen(pageIndex: index)));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(pages[index],),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
