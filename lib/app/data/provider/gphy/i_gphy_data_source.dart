import 'package:dartz/dartz.dart';
import 'package:flutter_example_test/app/data/models/image_model.dart';

abstract class IGphyDataSource{


  Future<Either<Exception, List<ImageGiphy>>> getRandomGphy({required int pagination,});

  Future<Either<Exception, List<ImageGiphy>>> searchGphy({
    required String search,
    required int pagination,
  });

}
