import 'package:flutter/cupertino.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;

  void setContext(BuildContext context);
  void init();

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;
}
