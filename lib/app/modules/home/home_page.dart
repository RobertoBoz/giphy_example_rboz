// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_test/app/data/enums/enums.dart';
import 'package:flutter_example_test/app/modules/home/cubit/home_cubit.dart';
import 'package:flutter_example_test/app/modules/home/widgets/image_item.dart';

import 'package:flutter_example_test/app/modules/home/widgets/text_field_custom.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});
   
   HomeCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => HomeCubit()..getInitalGiphy()..initListener(),      
      child: Scaffold(              
        appBar: AppBar(
          toolbarHeight: 100,
          flexibleSpace: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xffE5E5E5),
            child: Center(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {             
                  cubit = context.read<HomeCubit>();
                  return TextFieldCustom(onChanged:  cubit!.onChangedText,);                                    
                },
              ),
            ),
          ),        
      ),
      body: BlocBuilder<HomeCubit, HomeState>(          
        builder: (context, state) {
            cubit = context.read<HomeCubit>();

            switch( state.status){
              
              case HomeStatus.initial:
                return state.list.isNotEmpty ?  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MasonryGridView.count(
                    physics:  const BouncingScrollPhysics(),
                    crossAxisCount: 2,     
                    controller: cubit!.scrollController,                         
                    mainAxisSpacing: 5,
                    crossAxisSpacing:5,                            
                    itemBuilder: (context, index){                
                      return ImageTile(  image: cubit!.state.list[index], vistaSolicitada: true,);
                    },
                    itemCount: cubit!.state.list.length ,                     
                  ),
                ) : const Center(child: Text('No hay resultados que coincidan con la búsqueda.'));     
              case HomeStatus.load:
                return  const Center(child: CircularProgressIndicator(),);                                   
              case HomeStatus.error:
                return  Center(
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: cubit!.getInitalGiphy,                  
                    child: const Text('Intenta de nuevo', style: TextStyle(color: Colors.white),),
                  ),
                );
            }
                                                
          }
        ,)
      ,)
    ,);
  }
}
