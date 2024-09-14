## API Class Documentation

### Table of Contents

- [Overview](#overview)
- [Authentication Endpoints](#authentication-endpoints)

### Overview

The `API` class defines the base URL and endpoints for interacting with the backend API.

**Base URL:**

The `BASE_URL` constant holds the base URL for all API requests. This should be replaced with the actual API base URL.

### Authentication Endpoints

The `API` class defines two endpoints for authentication:

| Endpoint | Description |
|---|---|
| `LOGIN` |  Logs in a user. |
| `REGISTER` | Registers a new user. |

**Example:**

```dart
// Example usage of API endpoints
final loginUrl = API.LOGIN; // "$BASE_URL/users/login"
final registerUrl = API.REGISTER; // "$BASE_URL/users/register"
```