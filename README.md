# Flutter Bloc Clean Architecture Boilerplate

This is a Flutter project boilerplate that adheres to the principles of Clean Architecture. It is designed to help you jumpstart your Flutter projects by providing a structured and organized project setup. This boilerplate utilizes the BLoC state management pattern, GetIt for dependency injection, and Freezed for code generation.

## Project Structure

The project follows a well-defined directory structure to keep your code organized and maintainable. Here's an overview of the key directories:

- **Src**: The main source code directory.

    - **Common**: Contains common files such as API endpoints, constants, exceptions, colors, screen sizes, and enums.

    - **Data**: Responsible for data handling.

        - **Datasource**: Data sources, such as API clients or databases.

        - **Model**: Data models that represent your application's data.

        - **Repository**: Data repositories, which abstract the data source.

    - **Domain**: Contains the core business logic.

        - **Entity**: Business entities or domain models.

        - **Repository**: Interfaces that define how data is accessed in the domain layer.

        - **Usecase**: Use cases that represent the application's business operations.

    - **Presentation**: Handles the user interface and interaction.

        - **Bloc**: BLoC classes responsible for managing the state of your application.

        - **Cubit**: Cubit classes for more lightweight state management.

        - **Page**: Flutter pages/screens.

        - **Widget**: Reusable UI components.

    - **Utilities**: Helper classes and utilities for the application.

- **Injection.dart**: Dependency injection setup using GetIt.

- **Main.dart**: The entry point of the Flutter application.

## Getting Started

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/ishitgami/flutter-bloc-clean-architecture-boilerplate

2. Navigate to the project directory:

   ```shell
   cd flutter-bloc-clean-architecture-boilerplate

3. Install dependencies using Flutter's package manager:

   ```shell
    flutter pub get
   
You can now start building your application using this clean architecture boilerplate.

## Features
- Structured and organized project setup.
- Clean Architecture pattern.
- BLoC state management.
- GetIt for dependency injection.
- Freezed for code generation.

## Contributing
Feel free to contribute to this project by submitting issues or pull requests. If you have any suggestions or improvements, we welcome your contributions.


Happy coding! 🚀
