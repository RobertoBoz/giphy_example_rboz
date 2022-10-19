import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_test/app/data/enums/enums.dart';
import 'package:flutter_example_test/app/data/registrer.dart';
import 'package:flutter_example_test/app/global/cubit/global_cubit.dart';
import 'package:flutter_example_test/app/routes/app_routes.dart';
import 'package:flutter_example_test/app/routes/app_routes_name.dart';
import 'package:flutter_example_test/app/theme/theme.dart';
import 'package:flutter_example_test/app/utils/dio_singleton.dart';
import 'package:flutter_example_test/app/utils/snackbar_error.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Register.regist();
  Firebase.initializeApp();
  DioSingleton.createDio();
  runApp( App());
}

class App extends StatelessWidget {

  App({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit()..changedPage(),
      child: MaterialApp(
        title: 'Giphy Rboz',
        theme: ThemeApp.getTheme(),
          routes: Routes.appRoutes,
          initialRoute: RoutesName.initialPage,
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          builder: (BuildContext context,child){  
            SnackBarSingleton.contextSnackBar = context;          
            return MultiBlocListener(
              listeners: [
                BlocListener<GlobalCubit, GlobalState>(
                  listener: (context,state) async{             
                    switch(state.statusApp){                      
                        case GlobalStatusApp.splash:
                          await _navigator.pushNamedAndRemoveUntil(
                            RoutesName.splash,(Route<dynamic> route) => false,
                        );
                      break;
                        case GlobalStatusApp.home:
                          await _navigator.pushNamedAndRemoveUntil(
                          RoutesName.home,(Route<dynamic> route) => false,
                        );
                      break;                   
                    }                                      
                  },
                ),
              ],
              child:child! ,
            );
          },
        ),
      
    );
  }
}
