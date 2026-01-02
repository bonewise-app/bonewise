import 'package:flutter/material.dart';
import '../../app_strings.dart';

class ModuleScreen extends StatelessWidget {
  final String title;

  const ModuleScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: Text(title,style:TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "This section provides general educational information.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            ...List.generate(5, (index) => Text("• Placeholder topic ${index+1}"),),

            const Spacer(),

            const Text(
              AppStrings.mediumDisclaimer,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
