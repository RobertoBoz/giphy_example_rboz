import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show ScrollController;
import 'package:flutter_example_test/app/data/enums/enums.dart';
import 'package:flutter_example_test/app/data/models/image_model.dart';
import 'package:flutter_example_test/app/data/provider/gphy/i_gphy_data_source.dart';
import 'package:flutter_example_test/app/utils/snackbar_error.dart';
import 'package:injector/injector.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()){
    _ghyphiRepository = Injector.appInstance.get<IGphyDataSource>();
  }

  final scrollController  = ScrollController();

  late IGphyDataSource  _ghyphiRepository; 
  
  Future<void> getInitalGiphy({int pagination = 0}) async{
    final response = await _ghyphiRepository.getRandomGphy(pagination: pagination,);    
    response.fold(
      (l){
         SnackBarSingleton.showSnack('Error conectando con el servidor');
         emit(state.copyWith(status: HomeStatus.error,),);
      }, 
      (r){
        List<ImageGiphy> list;                  
        if( pagination != 0){
          list = state.list..addAll(r);          
        }else{
          list = r;
        }

        emit(state.copyWith(list: list,status: HomeStatus.initial,isSearch: false,search: '',pagination: pagination));
      }
    );
    
  }

   Future<void> onChangedText ( String search ,{int pagination = 0}) async {
    emit(state.copyWith(status: HomeStatus.load));
        
    if(search == ''){
      await  getInitalGiphy();

    }else{
      final listsearch = await _ghyphiRepository.searchGphy(search: search,pagination: pagination,);

      listsearch.fold(
        (l) {
          SnackBarSingleton.showSnack('Error conectando con el servidor');
          emit(state.copyWith(status: HomeStatus.error,),);

        }, 
        (r) {
          List<ImageGiphy> list;                   
          if( pagination != 0){
            list = state.list..addAll(r);          
          }else{
            list = r;
          }
          emit(state.copyWith(list: list,status: HomeStatus.initial,isSearch: true,pagination:pagination,search: search));
        },
      );           
    }            
  }

  void initListener(){
    scrollController.addListener(() async  {
      if(scrollController.position.atEdge){
        final isTop = scrollController.position.pixels == 0;
        if(isTop){

        }else{
          if(state.isSearch){
            await onChangedText(state.search,pagination: state.pagination +1 * 50);
            return; 
          }
          await getInitalGiphy(pagination: state.pagination+1 * 50);         
        }
      }
    });
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

}
