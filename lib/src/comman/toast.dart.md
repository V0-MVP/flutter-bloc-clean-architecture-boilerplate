##  Internal Code Documentation: `showToast` Function

### Table of Contents

* [**Function Overview**](#function-overview)
* [**Parameters**](#parameters)
* [**Usage Example**](#usage-example)
* [**Return Value**](#return-value)

### Function Overview

This function provides a convenient way to display a toast message to the user. 

### Parameters

| Parameter | Type | Description |
|---|---|---|
| `msg` | `String` | The message to be displayed in the toast. |
| `backgroundColor` | `Color?` | The background color of the toast. Defaults to `ColorLight.primary` from the `colors.dart` file. |
| `textColor` | `Color?` | The text color of the toast. Defaults to `Colors.white`. |

### Usage Example

```dart
showToast(msg: 'Data saved successfully!'); // Displays a toast with default colors.
showToast(msg: 'Error occurred', backgroundColor: Colors.red, textColor: Colors.white); // Displays a toast with custom colors.
```

### Return Value

The function returns a `Future<dynamic>`. This future resolves to a `dynamic` value. However, it is not typically used as the function is primarily used for its side effect of displaying the toast message.  
