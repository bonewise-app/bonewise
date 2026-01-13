import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/life_style/movement_recovery/movement_recovery_menu_screen.dart';
import 'package:bonewise/features/life_style/nutrition_bone_health/nutrition_bone_health_menu_screen.dart';
import 'package:flutter/material.dart';

class LifestylePreventionScreen extends StatelessWidget {
  const LifestylePreventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: const Text(AppStrings.lifestylePrevention, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            menuTile(
              context,
              title: AppStrings.movementRecovery,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MovementRecoveryMenuScreen()));
              },
            ),
            const SizedBox(height: 12),
            menuTile(
              context,
              title: AppStrings.nutritionBoneHealth,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const NutritionBoneHealthMenuScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget menuTile(BuildContext context, {required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Text(title),
      ),
    );
  }
}
