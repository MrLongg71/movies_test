# App Architecture

This sample follows BLoC pattern + Clean Architecture.

## Stack tech

- Flutter

- [Bloc](https://bloclibrary.dev) for state management

- [get_it](https://pub.dev/packages/get_it) for dependency injection

![image](https://user-images.githubusercontent.com/41661101/230762542-b710334e-0b0c-4a4a-a68f-354d038ec089.png)

## Installation

This app was created and tested on `Flutter Channel stable, 3.24.0` and `Dart 3.5.0 (stable)` .
Sign up TMDB and don't forget to replace the API_TOKEN value in the .env file with your own.

```
git clone https://github.com/MrLongg71/movies_test
cd flutter-tdd-clean-architecture
flutter packages get
```

- For debug mode run `flutter run` and for production mode run `flutter run --release`

- To run the code generator using `, run `flutter pub run build_runner watch
  --delete-conflicting-outputs`.
- To run the code generator using (`json_serializable`, `freezed`, `getIt`),
  run `flutter pub run build_runner build --delete-conflicting-outputs`

## Major Libraries / Tools

| Category                        	 | Library/Tool   	         | Link                                                       	            |
|-----------------------------------|--------------------------|-------------------------------------------------------------------------|
| Development                     	 | Flutter - Dart 	         | https://flutter.dev/                       	                            |
| IDE 	                             | Android Studio         	 | https://developer.android.com/studio               	                    |
| Dependency Injection              | injectable               | https://pub.dev/packages/injectable                                   	 |
| Service Locator                   | get_it                   | https://pub.dev/packages/get_it                                   	     |
| Presentation Layer Mangement      | flutter_bloc             | https://pub.dev/packages/flutter_bloc                                   |
| Code Generator                    | Freezed                  | https://pub.dev/packages/freezed                                        |
| HTTP Client                       | Dio                      | https://pub.dev/packages/dio                                            |
| Mock data unit test               | Mock                     | https://pub.dev/packages/mockito                                        |

## Testing

To run the testing (unit test & integration test) sample
run `flutter pub run build_runner watch --delete-conflicting-outputs`.

## Demo


