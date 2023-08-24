import 'package:flutter/material.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/favorite_quote/presentation/screens/favorite_quote_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favoriteRoute = '/favoriteQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const QuoteApp()));

      case Routes.favoriteRoute:
        return MaterialPageRoute(
            builder: ((context) => const FavoriteQuoteScreen()));

      default:
        return undifinedRoute();
    }
  }

  static Route<dynamic> undifinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
