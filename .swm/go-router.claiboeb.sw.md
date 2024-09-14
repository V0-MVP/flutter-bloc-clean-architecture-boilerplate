---
title: Go Router
---
<SwmSnippet path="/lib/src/utilities/go_router_init.dart" line="11">

---

&nbsp;

```dart
GoRouter routerinit = GoRouter(
  routes: <RouteBase>[
    ///  =================================================================
    ///  ********************** Splash Route *****************************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.SPLASH_ROUTE_NAME,
      path: AppRoutes.SPLASH_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    ///  =================================================================
    /// ********************** Authentication Routes ********************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.LOGIN_ROUTE_NAME,
      path: AppRoutes.LOGIN_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      name: AppRoutes.SIGNUP_ROUTE_NAME,
      path: AppRoutes.SIGNUP_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUnPage();
      },
    ),

    ///  =================================================================
    /// ********************** DashBoard Route ******************************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.DASHBOARD_ROUTE_NAME,
      path: AppRoutes.DASHBOARD_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const DashBoardScreen();
      },

    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorScreen());
  },
  redirect: (context, state) {
    logger.info('redirect: ${state.uri}');
    return null;
  },
);
```

---

</SwmSnippet>

<SwmToken path="/lib/src/utilities/go_router_init.dart" pos="17:4:4" line-data="      name: AppRoutes.SPLASH_ROUTE_NAME,">`AppRoutes`</SwmToken>

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZmx1dHRlci1ibG9jLWNsZWFuLWFyY2hpdGVjdHVyZS1ib2lsZXJwbGF0ZSUzQSUzQWlzaGl0Z2FtaQ==" repo-name="flutter-bloc-clean-architecture-boilerplate"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
