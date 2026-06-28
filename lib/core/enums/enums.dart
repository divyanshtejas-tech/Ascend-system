/// Enum for user ranks in the RPG system
enum UserRank {
  F('F', 0),
  E('E', 1),
  D('D', 2),
  C('C', 3),
  B('B', 4),
  A('A', 5),
  S('S', 6),
  SS('SS', 7),
  SSS('SSS', 8);

  final String displayName;
  final int level;

  const UserRank(this.displayName, this.level);
}

/// Enum for fitness goals
enum FitnessGoal {
  weightLoss('Weight Loss'),
  muscleGain('Muscle Gain'),
  athletic('Athletic'),
  powerlifting('Powerlifting'),
  bodybuilding('Bodybuilding'),
  animePhysique('Anime Physique'),
  calisthenics('Calisthenics');

  final String displayName;

  const FitnessGoal(this.displayName);
}

/// Enum for diet goals
enum DietGoal {
  bulk('Bulk'),
  cut('Cut'),
  maintenance('Maintenance'),
  leanBody('Lean Body'),
  highProtein('High Protein'),
  indianMeals('Indian Meals'),
  vegetarian('Vegetarian'),
  nonVegetarian('Non Vegetarian');

  final String displayName;

  const DietGoal(this.displayName);
}

/// Enum for workout difficulty
enum WorkoutDifficulty {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced'),
  expert('Expert');

  final String displayName;

  const WorkoutDifficulty(this.displayName);
}

/// Enum for gender
enum Gender {
  male('Male'),
  female('Female'),
  other('Other');

  final String displayName;

  const Gender(this.displayName);
}

/// Enum for diet type
enum DietType {
  vegetarian('Vegetarian'),
  nonVegetarian('Non-Vegetarian'),
  vegan('Vegan');

  final String displayName;

  const DietType(this.displayName);
}

/// Enum for quest type
enum QuestType {
  workout('Workout'),
  study('Study'),
  waterIntake('Water Intake'),
  sleep('Sleep'),
  meditation('Meditation'),
  reading('Reading'),
  walking('Walking'),
  stretching('Stretching'),
  custom('Custom');

  final String displayName;

  const QuestType(this.displayName);
}
