import 'package:flutter/material.dart';
import 'package:flutter_example_test/app/modules/splash/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'SplashPage',
    () {     
      setUp(() async {
      
      
      });
      testWidgets('Render', (tester) async {
        
        await tester.pumpWidget(
          const MaterialApp(
            home: SplashPage(),
          ),
        );      
        await tester.pumpAndSettle(const Duration(seconds: 5));

         expect(find.byType(SplashPage), findsOneWidget);
        });
    },
  );
}
