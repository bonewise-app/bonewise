import 'package:bonewise/app_strings.dart';

class Question {
  final String text;
  final bool allowSometimes;
  final bool isRedFlag;

  Question({
    required this.text,
    required this.allowSometimes,
    required this.isRedFlag,
  });
}

final questions = <Question>[
  // SECTION 1
  Question(text: AppStrings.que1, allowSometimes: true, isRedFlag: false),
  Question(text: AppStrings.que2, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que3, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que4, allowSometimes: false, isRedFlag: true),
  Question(text: AppStrings.que5, allowSometimes: false, isRedFlag: false),

  // SECTION 2
  Question(text: AppStrings.que6, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que7, allowSometimes: true, isRedFlag: false),
  Question(text: AppStrings.que8, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que9, allowSometimes: true, isRedFlag: false),
  Question(text: AppStrings.que10, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que11, allowSometimes: false, isRedFlag: true),

  // SECTION 3
  Question(text: AppStrings.que12, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que13, allowSometimes: true, isRedFlag: false),
  Question(text: AppStrings.que14, allowSometimes: false, isRedFlag: true),
  Question(text: AppStrings.que15, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que16, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que17, allowSometimes: false, isRedFlag: true),

  // SECTION 4
  Question(text: AppStrings.que18, allowSometimes: false, isRedFlag: true),
  Question(text: AppStrings.que19, allowSometimes: true, isRedFlag: true),
  Question(text: AppStrings.que20, allowSometimes: false, isRedFlag: true),
  Question(text: AppStrings.que21, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que22, allowSometimes: false, isRedFlag: false),

  // SECTION 5
  Question(text: AppStrings.que23, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que24, allowSometimes: true, isRedFlag: true),
  Question(text: AppStrings.que25, allowSometimes: false, isRedFlag: true),
  Question(text: AppStrings.que26, allowSometimes: false, isRedFlag: false),
  Question(text: AppStrings.que27, allowSometimes: true, isRedFlag: true),
  Question(text: AppStrings.que28, allowSometimes: false, isRedFlag: false),
];
