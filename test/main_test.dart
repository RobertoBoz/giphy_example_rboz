import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_example_test/app/data/enums/enums.dart';
import 'package:flutter_example_test/app/data/registrer.dart';
import 'package:flutter_example_test/app/global/cubit/global_cubit.dart';
import 'package:flutter_example_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('main',() {     
      setUp(() async {
        Register.regist(isMock: true);        
      
      });
      testWidgets('Render Main App', (tester) async {
        await tester.pumpWidget( App());
        await tester.pumpAndSettle(const Duration(seconds: 5));
         expect(find.byType(App), findsOneWidget);
        });
    },
  );

   group('GlobalCubit',() {   
      late GlobalCubit globalCubit;  
     
      setUp(() {          
        globalCubit = GlobalCubit();        
      });

      blocTest<GlobalCubit,GlobalState>(
      'Change Page', 
        build: () => globalCubit,
        act: (cubit) async {
          cubit.changedPage();
        },     
        wait: const Duration(seconds: 5),   
        expect: () =>  [
          const GlobalState(statusApp: GlobalStatusApp.home),            
        ],
      );
    },
  );
}
