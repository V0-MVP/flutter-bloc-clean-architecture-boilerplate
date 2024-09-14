## Authentication Repository Documentation 🔐

### Table of Contents

* [Authentication Repository](#authentication-repository)
    * [Description](#description)
    * [Methods](#methods)

### Authentication Repository

#### Description

The `AuthenticationRepository` abstract class defines the interface for an authentication system, abstracting away the specific implementation details of authentication. This allows for different authentication mechanisms to be used interchangeably without affecting the rest of the application.

#### Methods

| Method | Description |
|---|---|
| `login(String email, String password)` | Attempts to log in a user with the provided email and password. Returns `Right(null)` on successful login, and `Left(Failure)` on failure. |

```dart
import 'package:bloc_clean_architecture/src/comman/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, void>> login(String email, String password);
}
```