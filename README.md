# ASCEND SYSTEM

A futuristic RPG-inspired fitness and self-improvement application built with Flutter.

## Features

- 🎮 **RPG Ranking System** - F to SSS ranks with XP progression
- 💪 **AI-Powered Workout Generator** - Multiple goals and customization
- 📚 **Study Tracker** - Track study hours and set goals
- 🏅 **Achievement System** - Unlock badges and titles
- 💰 **Reward Shop** - Spend gold on real-world rewards
- 📊 **Progress Analytics** - Detailed statistics and charts
- 🔔 **Smart Notifications** - Reminders and achievements
- 🌙 **Offline Support** - Works without internet
- 🎨 **Futuristic UI** - Holographic neon design

## Tech Stack

- **Frontend**: Flutter, Material 3, Riverpod
- **Backend**: Firebase (Auth, Firestore, Storage, Messaging)
- **State Management**: Riverpod with MVVM
- **Local Storage**: Hive, SharedPreferences
- **3D Models**: Model Viewer Plus
- **Animations**: Lottie, Rive

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Firebase Project
- Android/iOS development environment

### Setup

1. Clone repository
```bash
git clone https://github.com/divyanshtejas-tech/Ascend-system.git
cd Ascend-system
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure Firebase
```bash
flutter pub global activate flutterfire_cli
flutterfire configure
```

4. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── config/              # App configuration
├── core/                # Core utilities and constants
├── data/                # Data layer (repositories, models)
├── domain/              # Domain layer (entities, usecases)
├── presentation/        # Presentation layer (UI, state)
├── services/            # External services
├── animations/          # Animation utilities
├── widgets/             # Reusable widgets
└── main.dart            # Entry point
```

## Architecture

The app follows Clean Architecture with MVVM pattern:

- **Presentation Layer**: UI, ViewModels, State Management
- **Domain Layer**: Entities, Use Cases, Repository interfaces
- **Data Layer**: Firebase integration, Local storage, Models

## Contributing

Contributions are welcome! Please follow the code style and architecture patterns.

## License

MIT License
