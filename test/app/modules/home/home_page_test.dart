import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_test/app/data/registrer.dart';
import 'package:flutter_example_test/app/modules/home/cubit/home_cubit.dart';
import 'package:flutter_example_test/app/modules/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late HomeCubit homeCubit;  

  group(
    'HomePage',
    () {     
    setUp(() {
      Register.regist(isMock: true);                
    });
        
    testWidgets('Render ', (tester) async {        
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );      
      await tester.pumpAndSettle(const Duration(seconds: 5));
        expect(find.byType(HomePage), findsOneWidget);
      });
    },
    
  );

  group('HomeCubit', () {
      setUp(() {          
        homeCubit = HomeCubit();        
      });

      blocTest<HomeCubit,HomeState>(
      'GetListSearch', 
        build: () => homeCubit,
        act: (cubit) async {
          await cubit.onChangedText('hola');
        },        
        expect: () =>  [
            isA<HomeState>(),
            isA<HomeState>(),
        ],
      );
        
        blocTest<HomeCubit,HomeState>(
          'GetListtrending', 
          build: () => homeCubit,
          act: (cubit) async {
            await cubit.getInitalGiphy();
          },        
          wait: const Duration(seconds: 2 ),
          expect: () =>  [
            isA<HomeState>(),
          ],
        );
      }
    );
}
