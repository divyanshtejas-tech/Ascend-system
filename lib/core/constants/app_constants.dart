// App Constants
class AppConstants {
  static const String appName = 'ASCEND SYSTEM';
  static const String appVersion = '1.0.0';

  // Rank System
  static const List<String> ranks = ['F', 'E', 'D', 'C', 'B', 'A', 'S', 'SS', 'SSS'];
  static const List<int> xpPerRank = [
    1000,   // F -> E
    2000,   // E -> D
    3000,   // D -> C
    5000,   // C -> B
    8000,   // B -> A
    13000,  // A -> S
    21000,  // S -> SS
    34000,  // SS -> SSS
  ];

  // XP Rewards
  static const int workoutXpReward = 100;
  static const int studyXpReward = 50;
  static const int waterIntakeXpReward = 25;
  static const int sleepXpReward = 75;
  static const int meditationXpReward = 30;
  static const int readingXpReward = 40;
  static const int walkingXpReward = 35;
  static const int stretchingXpReward = 20;

  // Gold Rewards
  static const int workoutGoldReward = 50;
  static const int studyGoldReward = 25;
  static const int loginBonusGold = 10;

  // Special Quest
  static const int specialQuestXpReward = 500;
  static const int specialQuestGoldReward = 250;
  static const int specialQuestStudyHours = 5;

  // Workout Difficulty Multiplier
  static const Map<String, double> difficultyMultiplier = {
    'Beginner': 0.8,
    'Intermediate': 1.0,
    'Advanced': 1.5,
    'Expert': 2.0,
  };

  // Energy System
  static const int maxEnergy = 100;
  static const int workoutEnergyDrain = 20;
  static const int studyEnergyDrain = 10;
  static const int energyRechargePerHour = 10;
}
