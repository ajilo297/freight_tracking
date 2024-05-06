# freight_tracking

Freight Tracking Project

[![codecov](https://codecov.io/gh/ajilo297/freight_tracking/graph/badge.svg?token=XE1ODUCNZ7)](https://codecov.io/gh/ajilo297/freight_tracking)

## Getting Started

This project is built using Flutter SDK. To get started, you need to have Flutter SDK installed on
your machine. You can follow the instructions on
the [official Flutter website](https://flutter.dev/docs/get-started/install) to install Flutter SDK
on your machine.

## Running the project

### Get dependencies

```bash
dart pub get
```

### Generate required files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the project

```bash
flutter run
```

### Running tests

Requires

- genhtml: To generate HTML reports
- lcov: To transform LCOV reports

```bash
chmod +x ./tools/run_tests.sh
./tools/run_tests.sh
```

#### Test Report

![View Test report](assets/test-report.png)

#### Coverage Report

![Coverage report](assets/coverage-report.png)

## Screenshots

#### Login Screen

![Login Screen](assets/1.png)

#### Invalid Credentials Error Snack Bar

![Invalid Credentials Error Snack Bar](assets/2.png)

#### Freight List Screen

![Freight List Screen](assets/3.png)

#### Freight Details Screen

![Freight Details Screen](assets/4.png)

#### Freight Details Screen - Update instructions

![Freight Details Screen - Update instructions](assets/5.png)