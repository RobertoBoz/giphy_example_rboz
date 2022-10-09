import 'package:flutter/cupertino.dart';
import 'package:flutter_example_test/app/modules/home/home_page.dart';
import 'package:flutter_example_test/app/modules/splash/splash_page.dart';

import 'package:flutter_example_test/app/routes/app_routes_name.dart';

class Routes {

  static T getArguments<T>(BuildContext context){
    return ModalRoute.of(context)!.settings.arguments as T;
  }

  static Map<String,Widget Function(BuildContext)>get appRoutes{
    return {
      RoutesName.splash: (_) => const SplashPage(),
      RoutesName.home: (_) =>  HomePage(),
   
    };
  }
}
