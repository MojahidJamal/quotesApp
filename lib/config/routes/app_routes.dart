import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/favorite_quote/presentation/screens/favorite_quote_screen.dart';
import 'package:quotes/features/random_qutoe/presenation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_qutoe/presenation/screens/quote_screen.dart';
import 'package:quotes/injection_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String favoriteRoute = '/favoriteQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: const QuoteScreen(),
                ));

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
