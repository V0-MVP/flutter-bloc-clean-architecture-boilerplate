## Authentication Remote Data Source

**Table of Contents**

- [AuthenticationRemoteDataSource](#authenticationremotedatasource)
    - [login](#login)
- [AuthenticationRemoteDataSourceImpl](#authenticationremotedatasourceimpl)

### AuthenticationRemoteDataSource

This abstract class defines the contract for the authentication remote data source.

#### login

```dart
Future<void> login(String email, String password);
```

Logs in a user with the provided email and password.

**Parameters:**

| Parameter | Type | Description |
|---|---|---|
| `email` | `String` | The user's email address. |
| `password` | `String` | The user's password. |

**Returns:**

| Type | Description |
|---|---|
| `Future<void>` | A future that completes when the login process is finished. |

**Throws:**

| Exception | Description |
|---|---|
| `DioError` | If there is an error during the API call. |

### AuthenticationRemoteDataSourceImpl

This class implements the `AuthenticationRemoteDataSource` interface. It uses the Dio library to make API calls to the login endpoint.

```dart
class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<void> login(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await dio.post(API.LOGIN, data: {
        'email': email,
        'password': password,
      });
      final token = response.data['token'].toString();
      await prefs.setString(ACCESS_TOKEN, token);
    } catch (e) {
      rethrow;
    }
  }
}
```

**Fields:**

| Field | Type | Description |
|---|---|---|
| `dio` | `Dio` | An instance of the Dio library used to make API calls. |

**Methods:**

#### login

This method implements the `login` method defined in the `AuthenticationRemoteDataSource` interface.

**Implementation:**

1. Gets an instance of the SharedPreferences class.
2. Uses the `dio` object to make a POST request to the `API.LOGIN` endpoint with the provided email and password.
3. Extracts the access token from the response data.
4. Stores the access token in the SharedPreferences instance using the `ACCESS_TOKEN` key.

**Throws:**

| Exception | Description |
|---|---|
| `DioError` | If there is an error during the API call. |
