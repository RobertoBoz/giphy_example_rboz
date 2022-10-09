
import 'package:dartz/dartz.dart';
import 'package:flutter_example_test/app/data/models/image_model.dart';
import 'package:flutter_example_test/app/data/provider/gphy/i_gphy_data_source.dart';

 class MockGphyDataSource  extends IGphyDataSource{
  @override
  Future<Either<Exception, List<ImageGiphy>>> getRandomGphy({required int pagination}) async {
    
    return  Right([
      ImageGiphy(height: 12, url: '', widght: 20,),
      ImageGiphy(height: 13, url: '', widght: 50,)
      ],
    );
  }

  @override
  Future<Either<Exception, List<ImageGiphy>>> searchGphy({required String search, required int pagination}) async{
     return  Right([
      ImageGiphy(height: 12, url: '', widght: 20,),
      ImageGiphy(height: 13, url: '', widght: 50,)
      ],
    );
  }

}
