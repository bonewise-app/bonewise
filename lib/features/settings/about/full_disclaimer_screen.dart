import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class FullDisclaimerScreen extends StatelessWidget {
  const FullDisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text("Medical Disclaimer", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(AppStrings.longDisclaimer)),
      ),
    );
  }
}
