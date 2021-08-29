import 'package:flutter/material.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/home/model/detail_model.dart';
import '../../../view/home/view/detail_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../../view/profile/view/profile_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../components/card/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());
      case NavigationConstants.USER_DETAIL:
        if (args.arguments is Data) {
          return normalNavigate(DetailView(
            args.arguments as Data,
          ));
        }
        throw Error();
      case NavigationConstants.USER_PROFILE:
        return normalNavigate(ProfileView());
      default:
        return MaterialPageRoute(builder: (context) => NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) => MaterialPageRoute(builder: (context) => widget);
}
