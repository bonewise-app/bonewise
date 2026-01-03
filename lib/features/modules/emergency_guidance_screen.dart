import 'package:flutter/material.dart';
import '../../app_strings.dart';

class EmergencyGuidanceScreen extends StatelessWidget {
  const EmergencyGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: const Text(AppStrings.emergencyGuidance, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              AppStrings.whatToDoImmediately,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text("• keep still \n• avoid movement \n• ensure safety \n• reassure"),

            SizedBox(height: 16),
            Text(
              AppStrings.whatNotToDo,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text("• no realignment \n• no massage \n• no force \n• don’t ignore worsening symptoms"),

            SizedBox(height: 16),
            Text(
              AppStrings.whenSeekMedicalCare,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text("• severe pain \n• deformity \n• numbness \n• open wounds \n• injury after fall/trauma"),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          AppStrings.emergencyDisclaimer,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
