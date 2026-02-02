import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class MythsFactsScreen extends StatelessWidget {
  const MythsFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myths = [
      AppStrings.myth1,
      AppStrings.myth2,
      AppStrings.myth3,
      AppStrings.myth4,
      AppStrings.myth5,
      AppStrings.myth6,
      AppStrings.myth7,
      AppStrings.myth8,
    ];

    final facts = [
      AppStrings.fact1,
      AppStrings.fact2,
      AppStrings.fact3,
      AppStrings.fact4,
      AppStrings.fact5,
      AppStrings.fact6,
      AppStrings.fact7,
      AppStrings.fact8,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(AppStrings.mythsFactsTitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              ...List.generate(
                facts.length,
                (index) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Myth: ", style: TextStyle(fontWeight: FontWeight.w600)),
                        Expanded(child: Text(myths[index])),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fact: ", style: TextStyle(fontWeight: FontWeight.w600)),
                        Expanded(child: Text(facts[index])),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: index==7?SizedBox():Divider()),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
        child: Text(AppStrings.mythsFooter, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
