import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/fracture/fracture_awareness_home_screen.dart';
import 'package:bonewise/features/modules/emergency_guidance_screen.dart';
import 'package:bonewise/features/modules/module_screen.dart';
import 'package:flutter/material.dart';

class AgeDashboardScreen extends StatelessWidget {
  final String ageKey;
  final String ageLabel;

  const AgeDashboardScreen({super.key, required this.ageKey, required this.ageLabel});

  final List<String> modules = const [
    AppStrings.boneHealthBasics,
    AppStrings.fractureAwareness,
    AppStrings.lifestylePrevention,
    AppStrings.emergencyGuidance,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30,
        title: Text("${AppStrings.boneHealthFor} [$ageLabel]", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                  onTap: () {
                    if (modules[index] == AppStrings.emergencyGuidance) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EmergencyGuidanceScreen()),
                      );
                    }
                    else if(modules[index] == AppStrings.fractureAwareness){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FractureAwarenessHomeScreen()),
                      );
                    }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ModuleScreen(title: modules[index]),
                        ),
                      );
                    }
                  },
                  child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                  ),
                  child: Text(modules[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
