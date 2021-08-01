import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:peliculas_app_fluter/app_routing/routes.dart';
import 'package:peliculas_app_fluter/screens/authentication/login/screen.dart';
import 'package:peliculas_app_fluter/screens/cart/cart_binding.dart';
import 'package:peliculas_app_fluter/screens/home/list-items/screen.dart';
import 'package:peliculas_app_fluter/screens/splash/screen.dart';

class AppRouting {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return GetPageRoute(
          page: () => LoginScreen(),
        );
      case AppRoutes.home:
        return GetPageRoute(
            page: () => ItemListScreen(), binding: CartScreenBindings());

      default:
        return GetPageRoute(
          settings: settings,
          page: () => SplashScreen(),
        );
    }
  }
}
