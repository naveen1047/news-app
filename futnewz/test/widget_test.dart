// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:futnewz/main.dart';

// void main() {
//   testWidgets('Clicking login button opens login view',
//       (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());

//     expect(find.text('LOGIN'), findsOneWidget);
//     expect(find.text('Full name'), findsOneWidget);

//     await tester.tap(find.text('LOGIN'));
//     await tester.pumpAndSettle();

//     //find arrow icon and no full name textfield
//     expect(find.text('Full name'), findsNothing);
//     expect(find.byIcon(Icons.keyboard_arrow_right), findsOneWidget);

//     await tester.tap(find.byIcon(Icons.keyboard_arrow_right));
//     await tester.pumpAndSettle();

//     expect(find.byIcon(Icons.search), findsOneWidget);
//   });
// }
