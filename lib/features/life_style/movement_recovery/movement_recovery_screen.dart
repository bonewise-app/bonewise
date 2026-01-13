import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';

class MovementRecoveryScreen extends StatelessWidget {
  final int pageIndex;

  MovementRecoveryScreen({super.key, required this.pageIndex});

  final List<Map<String, dynamic>> pages = [
    {
      'title': AppStrings.whyMovementMatters,
      'concept': "Why Movement Matters for Bones and Joints",
      'content':
          "Movement plays an important role in keeping bones, muscles, and joints healthy.\n"
          "This section explains why movement is important, not how to move.\n"
          "Bones are living structures and respond to regular use.\n"
          "Muscles support joints and bones.\n"
          "Too much inactivity may lead to stiffness and reduced confidence.\n"
          "Movement should not be forced or rushed.\n"
          "This explains why complete inactivity is usually avoided.",
      'zones': ["Bone Strength", "Muscle Support", "Joint Movement"],
      'dos': ["Understanding that use supports bone and joint health"],
      'donts': ["Believing all movement is harmful"],
      'age': [
        "Children: supervised movement",
        "Adolescents: growth caution",
        "Adults: avoid over- or under-protection",
        "Older adults: movement supports balance",
      ],
    },
    {
      'title': AppStrings.earlyRecoveryUnderstanding,
      'concept': "Understanding the Early Recovery Phase",
      'content':
          "Early recovery is a period of adjustment after injury or stress.\n"
          "Swelling, stiffness, and discomfort are common early.\n"
          "These reflect the body’s protective response.\n"
          "Recovery varies widely between individuals.",
      'zones': ["Pain & Confidence", "Joint Movement"],
      'dos': ["Accepting recovery varies"],
      'donts': ["Expecting fixed patterns"],
      'age': [
        "Children: avoid forced activity",
        "Adolescents: supervision important",
        "Adults: rushing increases risk",
        "Older adults: early balance caution",
      ],
    },
    {
      'title': AppStrings.returningToDailyActivities,
      'concept': "Understanding the Return to Daily Activities",
      'content':
          "Recovery includes regaining comfort in routine tasks.\n"
          "Daily activities are routine movements of life, not exercises.\n"
          "Hesitation is common and usually temporary.",
      'zones': ["Balance & Stability", "Muscle Support"],
      'dos': ["Understanding confidence returns gradually"],
      'donts': ["Expecting sudden normal function"],
      'age': [
        "Children: observe natural return",
        "Adolescents: peer pressure awareness",
        "Adults: ignoring discomfort delays recovery",
        "Older adults: environment safety matters",
      ],
    },
    {
      'title': AppStrings.confidenceAndFear,
      'concept': "Understanding Confidence and Fear During Recovery",
      'content':
          "Fear of movement is common after pain or injury.\n"
          "Pain can alter how the brain responds to movement.\n"
          "Avoidance may increase stiffness and reduce confidence.\n"
          "Pain does not always mean damage, but should not be ignored.",
      'zones': ["Pain & Confidence", "Balance & Stability"],
      'dos': ["Recognizing fear is common"],
      'donts': ["Avoiding all movement"],
      'age': [
        "Children: reassurance & supervision",
        "Adolescents: emotional guidance",
        "Adults: hidden fear delays recovery",
        "Older adults: fear of falling is common",
      ],
    },
    {
      'title': AppStrings.longTermBoneCare,
      'concept': "Thinking Beyond Short-Term Recovery",
      'content':
          "Long-term care focuses on safety and confidence over time.\n"
          "Bones and joints change with age and use.\n"
          "Balance and awareness support long-term independence.",
      'zones': ["Bone Strength", "Balance & Stability"],
      'dos': ["Awareness of long-term health"],
      'donts': ["Ignoring gradual balance changes"],
      'age': [
        "Children: safe habits early",
        "Adolescents: risk awareness",
        "Adults: busy routines hide warning signs",
        "Older adults: balance is critical",
      ],
    },
    {
      'title': AppStrings.safetyAndRedFlags,
      'concept': "Knowing when to pause and seek medical advice",
      'content':
          "Some recovery signs should not be ignored.\n"
          "Not all discomfort means harm.\n"
          "Some recovery signs should not be ignored.\n"
          "Certain symptoms may indicate the need for medical review.",
      'zones': ["Pain Signals", "Joint Protection"],
      'dos': ["Seeking advice when unsure"],
      'donts': ["Ignoring worsening symptoms"],
      'emergencyPoints': [
        "Increasing pain",
        "Rapid swelling or redness",
        "Visible deformity",
        "Loss of movement",
        "Fever or general unwellness",
      ],
      'isEmergency': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final page = pages[pageIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: Text(page['title'], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(page['concept'], style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            Text(page['content']),
            const SizedBox(height: 16),

            if (page['zones'] != null) ...[
              const Text("Human Movement Zones", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              ...page['zones'].map<Widget>((z) => Text("• $z")),
              const SizedBox(height: 16),
            ],

            if (page['dos'] != null) ...[
              const Text("Do / Don’t", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              ...page['dos'].map<Widget>((d) => Text("✓ $d")),
              ...page['donts'].map<Widget>((d) => Text("✗ $d")),
              const SizedBox(height: 16),
            ],

            if (page['age'] != null) ...[
              const Text("Age-Specific Emphasis", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              ...page['age'].map<Widget>((a) => Text("• $a")),
            ],

            if (page['emergencyPoints'] != null) ...[
              const SizedBox(height: 16),
              const Text("Emergency Emphasis", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const Text("Seek medical care if there is:"),
              const SizedBox(height: 6),
              ...page['emergencyPoints'].map<Widget>((e) => Text("• $e")),
            ],
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          page['isEmergency'] == true ? AppStrings.sprint4EmergencyFooter : AppStrings.sprint4Footer,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
