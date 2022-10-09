part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.list = const [],this.status = HomeStatus.load,this.isSearch = false,this.pagination = 0,this.search = ''});

  final List<ImageGiphy>list; 
  final HomeStatus status;
  final bool isSearch; 
  final int pagination;
  final String search;  

   HomeState copyWith({
    List<ImageGiphy>? list,
    HomeStatus? status,
    bool? isSearch,
    int? pagination,
    String? search,

  }) =>
      HomeState(
        list: list ?? this.list,
        status: status ?? this.status, 
        isSearch:isSearch ?? this.isSearch,
        pagination:  pagination ?? this.pagination,
        search: search ?? this.search,
      );


  @override
  List<Object> get props => [
    list,
    status,
    isSearch,
    pagination,
    search,
    
  ];
}
