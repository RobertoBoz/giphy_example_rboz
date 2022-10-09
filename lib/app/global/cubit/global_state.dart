part of 'global_cubit.dart';

 class GlobalState  extends Equatable {

  const GlobalState({this.statusApp = GlobalStatusApp.splash});


  final GlobalStatusApp statusApp ;

  GlobalState copyWith({
    GlobalStatusApp? statusApp,    
  }) => 
   GlobalState(
      statusApp: statusApp ?? this.statusApp,      
    );

  @override
  List<Object?> get props => [
    statusApp,
  ];

 }
