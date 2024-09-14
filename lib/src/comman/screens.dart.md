## Screens Class Documentation

### Table of Contents

* [Introduction](#introduction)
* [Methods](#methods)
    * [heigth(BuildContext context)](#heigthbuildcontext-context)
    * [statusbarHeight(BuildContext context)](#statusbarheightbuildcontext-context)
    * [width(BuildContext context)](#widthbuildcontext-context)
    * [isMobile(BuildContext context)](#ismobilebuildcontext-context)
    * [isPortrait(BuildContext context)](#isportraitbuildcontext-context)
    * [isLandscape(BuildContext context)](#islandscapebuildcontext-context)
    * [hideSystemBars()](#hidesystembars)
    * [showSystemBars()](#showsystembars)
    * [logoSize(BuildContext context)](#logosizebuildcontext-context)
    * [setPortrait()](#setportrait)
    * [setLandscape()](#setlandscape)
    * [resetOrientation()](#resetorientation)

### Introduction

The `Screens` class provides a collection of utility methods for accessing screen-related information and manipulating screen orientation in Flutter applications. 

### Methods

#### heigth(BuildContext context)

This method returns the height of the current screen in pixels.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
double screenHeight = Screens.heigth(context);
```

#### statusbarHeight(BuildContext context)

This method returns the height of the status bar in pixels.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
double statusBarHeight = Screens.statusbarHeight(context);
```

#### width(BuildContext context)

This method returns the width of the current screen in pixels.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
double screenWidth = Screens.width(context);
```

#### isMobile(BuildContext context)

This method checks whether the current screen is considered a mobile device. It returns `true` if the screen width is less than 728 pixels.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
if (Screens.isMobile(context)) {
  // Show mobile-specific UI elements.
}
```

#### isPortrait(BuildContext context)

This method checks whether the current screen is in portrait orientation. It returns `true` if the orientation is `Orientation.portrait`.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
if (Screens.isPortrait(context)) {
  // Show portrait-specific UI elements.
}
```

#### isLandscape(BuildContext context)

This method checks whether the current screen is in landscape orientation. It returns `true` if the orientation is `Orientation.landscape`.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
if (Screens.isLandscape(context)) {
  // Show landscape-specific UI elements.
}
```

#### hideSystemBars()

This method hides all system UI elements, including the status bar, navigation bar, and system overlay.

**Example:**

```dart
Screens.hideSystemBars();
```

#### showSystemBars()

This method shows all system UI elements, including the status bar, navigation bar, and system overlay.

**Example:**

```dart
Screens.showSystemBars();
```

#### logoSize(BuildContext context)

This method calculates the size of a logo based on the screen orientation. In portrait mode, the logo size is 5% of the screen height. In landscape mode, the logo size is 5% of the screen width.

| Parameter | Type | Description |
|---|---|---|
| context | `BuildContext` | The context of the widget calling the method. |

**Example:**

```dart
double logoSize = Screens.logoSize(context);
```

#### setPortrait()

This method sets the preferred screen orientation to portrait mode, allowing only portrait orientations (portrait up and portrait down).

**Example:**

```dart
Screens.setPortrait();
```

#### setLandscape()

This method sets the preferred screen orientation to landscape mode, allowing only landscape orientations (landscape left and landscape right).

**Example:**

```dart
Screens.setLandscape();
```

#### resetOrientation()

This method resets the screen orientation to the system's default orientation, allowing all orientations.

**Example:**

```dart
Screens.resetOrientation();
```