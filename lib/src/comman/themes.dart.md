## Internal Code Documentation - Theme Management

### Table of Contents

* [Theme Configuration](#theme-configuration)
    * [Light Theme](#light-theme)
    * [Dark Theme](#dark-theme)

### Theme Configuration

This file defines the light and dark theme configurations for the application.

**Dependencies:**

* `package:bloc_clean_architecture/src/comman/colors.dart`: Provides color constants for the theme.
* `package:flutter/material.dart`: Provides Flutter's built-in theming capabilities.
* `package:google_fonts/google_fonts.dart`: Provides Google Fonts integration for custom typography.

#### Light Theme

The `themeLight` function defines the light theme configuration. It sets the following properties:

| Property | Value |
|---|---|
| `brightness` | `Brightness.light` |
| `cardColor` | `ColorLight.card` |
| `disabledColor` | `ColorLight.disabledButton` |
| `hintColor` | `ColorLight.fontSubtitle` |
| `indicatorColor` | `ColorLight.primary` |
| `iconTheme` | `IconThemeData(color: ColorLight.fontTitle)` |
| `primaryColor` | `ColorLight.primary` |
| `textSelectionTheme` | `TextSelectionThemeData(cursorColor: ColorLight.primary)` |
| `checkboxTheme` | `CheckboxThemeData(side: BorderSide(color: ColorLight.disabledButton))` |
| `scaffoldBackgroundColor` | `ColorLight.background` |
| `appBarTheme` | `AppBarTheme(elevation: 0, centerTitle: true)` |
| `textTheme` | Custom Poppins text theme with specific color, font size, and weight for each text style. |

**Example Usage:**

```dart
ThemeData theme = themeLight(context);
```

#### Dark Theme

The `themeDark` function defines the dark theme configuration. It sets the following properties:

| Property | Value |
|---|---|
| `brightness` | `Brightness.dark` |
| `cardColor` | `ColorDark.card` |
| `disabledColor` | `ColorDark.disabledButton` |
| `hintColor` | `ColorDark.fontSubtitle` |
| `indicatorColor` | `ColorLight.primary` |
| `iconTheme` | `IconThemeData(color: ColorDark.fontTitle)` |
| `primaryColor` | `ColorLight.primary` |
| `textSelectionTheme` | `TextSelectionThemeData(cursorColor: ColorLight.primary)` |
| `checkboxTheme` | `CheckboxThemeData(side: BorderSide(color: ColorLight.disabledButton))` |
| `scaffoldBackgroundColor` | `ColorDark.background` |
| `appBarTheme` | `AppBarTheme(elevation: 0, centerTitle: true)` |
| `textTheme` | Custom Poppins text theme with specific color, font size, and weight for each text style. |

**Example Usage:**

```dart
ThemeData theme = themeDark(context);
```

**Notes:**

* The `colors.dart` file provides a consistent source for all theme colors.
* The `GoogleFonts` package is used for custom typography.
* The theme configurations can be easily customized by modifying the provided properties.