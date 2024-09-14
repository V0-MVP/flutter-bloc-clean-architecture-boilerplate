## Exception Types

This document outlines the exception types used in the application.

### Table of Contents

| Section | Description |
|---|---|
| [ServerException](#serverexception) | Exception related to server-side errors. |
| [DatabaseException](#databaseexception) | Exception related to database operations. |
| [CacheException](#cacheexception) | Exception related to cache operations. |

### <a name="serverexception"></a> ServerException

The `ServerException` class represents an exception related to server-side errors.

```dart
class ServerException implements Exception {

  ServerException(this.message);
  final String message;
}
```

**Properties:**

| Name | Type | Description |
|---|---|---|
| `message` | `String` | The error message associated with the exception. |

### <a name="databaseexception"></a> DatabaseException

The `DatabaseException` class represents an exception related to database operations.

```dart
class DatabaseException implements Exception {

  DatabaseException(this.message);
  final String message;
}
```

**Properties:**

| Name | Type | Description |
|---|---|---|
| `message` | `String` | The error message associated with the exception. |

### <a name="cacheexception"></a> CacheException

The `CacheException` class represents an exception related to cache operations.

```dart
class CacheException implements Exception {

  CacheException(this.message);
  final String message;
}
```

**Properties:**

| Name | Type | Description |
|---|---|---|
| `message` | `String` | The error message associated with the exception. |
