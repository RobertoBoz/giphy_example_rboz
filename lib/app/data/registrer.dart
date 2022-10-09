
import 'package:flutter_example_test/app/data/provider/gphy/i_gphy_data_source.dart';
import 'package:flutter_example_test/app/data/provider/gphy/mock_gphy.dart';
import 'package:flutter_example_test/app/data/provider/gphy/rest_provider_gphy.dart';
import 'package:injector/injector.dart';

class Register {
  static void regist({bool isMock = false}) {
    Injector.appInstance .registerDependency<IGphyDataSource>(() {
      final IGphyDataSource _authRepository;
      if(!isMock){
        _authRepository = RestProviderGphyDataSource();
      }else{
        _authRepository = MockGphyDataSource();
      }
     
      return _authRepository;
    });

  }
}
