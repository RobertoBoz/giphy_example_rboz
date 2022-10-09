
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example_test/app/data/enums/enums.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  void changedPage(){
    Future.delayed(const Duration(seconds: 5),(){
      emit(state.copyWith(statusApp: GlobalStatusApp.home, ),);
    });

  }
}
