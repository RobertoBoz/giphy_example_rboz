

import 'package:dartz/dartz.dart';

import 'package:flutter_example_test/app/data/models/image_model.dart';
import 'package:flutter_example_test/app/data/provider/gphy/i_gphy_data_source.dart';
import 'package:flutter_example_test/app/utils/dio_singleton.dart';

 class RestProviderGphyDataSource extends IGphyDataSource{
  @override
  Future<Either<Exception, List<ImageGiphy>>> getRandomGphy({required int pagination,}) async {

    try{
      final responseData =  await DioSingleton.dio.get<Map<String,dynamic>>('/trending',queryParameters: {'pagination':pagination,'offset':pagination});
      final response = List<ImageGiphy>.from(responseData.data!['data'].map(ImageGiphy.fromJson) as Iterable,);

      return Right(response);

    }catch(e){
        return Left(e as Exception); 
    }
  }

  @override
  Future<Either<Exception, List<ImageGiphy>>> searchGphy({
    required String search,
    required int pagination,
  }) async {
    try{

      final responseData =  await DioSingleton.dio.get<Map<String,dynamic>>('/search',queryParameters: {'q':search,'lang':'es','offset':pagination});
      final response = List<ImageGiphy>.from(responseData.data!['data'].map(ImageGiphy.fromJson) as Iterable,);

      return Right(response);  

    }catch(e){
      return Left(e as Exception); 
    }   
  }

}
