# Learning Language App

A Flutter application for learning languages with interactive features like flashcards, quizzes, puzzles, and word management.

## Features

- Home Screen - Dashboard with user profile and leaderboard
- Word Store - Personal collection of words
- Quiz - Interactive quiz system
- Puzzle - Sliding puzzle game
- Flashcard - 3D flip cards
- Search - Word search functionality
- Profile - User profile management
- Authentication - Google Sign-In

## Architecture

- Clean Architecture with BLoC pattern
- Domain Layer - Business logic
- Data Layer - Data sources and repositories  
- Presentation Layer - UI and state management

## Development

- BLoC for state management
- Freezed for immutable data
- GetIt for dependency injection
- SharedPreferences for local storage

## Getting Started

1. Clone & Install
   ```bash
   git clone https://github.com/aryo100/learning_language_app.git
   flutter pub get
   ```

2. Generate Code
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

3. Run App
   ```bash
   flutter run
   ```

## Workflow

1. Create domain layer (entities, repositories, use cases)
2. Create data layer (models, data sources, implementations)
3. Create presentation layer (BLoC, screens)
4. Register dependencies

## Dependencies

- flutter_bloc - State management
- freezed - Immutable classes
- get_it - Dependency injection
- go_router - Navigation

