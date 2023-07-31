# Flutter Pagination with Clean Architecture and BLoC State Management

 <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" alt="flutter" width="40" height="40"/> </a> 
 Flutter Pagination with Clean Architecture and BLoC State Management

This Flutter project showcases an implementation of pagination and data caching, adhering to Clean Architecture principles and utilizing BLoC state management. The code snippet efficiently handles pagination in lists and provides smooth data caching to enhance the app's performance and user experience.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)

## Overview

Pagination is an essential technique to manage large datasets in a mobile app. It allows data to be loaded in chunks as the user scrolls through the list, providing a more efficient and seamless experience. Additionally, data caching reduces unnecessary network requests and improves the app's responsiveness.

In this project, we demonstrate the implementation of pagination and caching using Clean Architecture principles. The data layer is abstracted from the presentation layer, enabling easy modification or replacement of data sources without affecting other parts of the app. We also utilize BLoC state management for efficient data flow and state handling in the user interface.

## Features

- Efficient pagination of lists
- Data caching for faster access
- Clean Architecture design pattern
- BLoC state management
- Error handling for network requests
- Easily customizable for specific use cases

## Project Structure

The project follows a modularized structure with clear separation of concerns:

```
- lib
  |- core
    |- handle_error
      |- exceptions.dart
      |- failure.dart
      |- network_info.dart
  |- data
    |- data_source
      |- remote_data_source.dart
    |- model
      |- post.dart
    |- repo
      |- base_repo.dart
      |- repo.dart
  |- domain
    |- usecase
      |- use_case.dart
  |- pagination
    |- ui
      |- view
        |- page_screen.dart
      |- widgets
        |- error_dialog.dart
        |- post_item.dart
    |- bloc
      |- pagination_bloc.dart
      |- pagination_event.dart
      |- pagination_state.dart
  |- main.dart
```

## Dependencies

The project relies on the following Flutter packages:

- dartz: ^0.10.1
- equatable: ^2.0.5
- flutter_bloc: ^8.1.3
- get_it: ^7.6.0
- http: ^1.1.0
- internet_connection_checker: ^1.0.0+1

Please ensure you have these dependencies listed in your `pubspec.yaml` file before running the project.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository to your local machine:

```bash
git clone https://github.com/AhmedSherif4/caching_data.git
```

2. Open the project in your preferred IDE (e.g., Android Studio, Visual Studio Code).

3. Install the Flutter dependencies by running:

```bash
flutter pub get
```

4. Ensure you have a working Flutter environment set up on your machine.

5. Run the project using your preferred emulator or connected device:

```bash
flutter run
```

## Usage

The app's main screen displays a list of posts fetched from a remote server using pagination. As the user scrolls through the list, more posts are fetched and appended to the existing list.

If there's an error in fetching data, an error dialog will be shown with a "Retry" button to attempt fetching data again.

The project demonstrates a clean and efficient way to handle pagination and caching in a Flutter app. Feel free to explore the code and customize it to fit your specific use cases.

## Contributing

Contributions to this project are welcome! If you find any bugs, want to add new features, or improve existing ones, please open an issue or submit a pull request.
