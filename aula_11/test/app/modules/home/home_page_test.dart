import 'package:aula_11/app/modules/home/home_controller.dart';
import 'package:aula_11/app/modules/home/home_page.dart';
import 'package:aula_11/app/modules/home/widgets/post_card/post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  HomeController controller;

  setUp(() {
    controller = HomeController();
  });
  group('HomePage test', () {
    testWidgets('HomePage - Init, Title, FAB', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));

      expect(find.text('Home Page'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('HomePage - Click FAB', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));

      await tester.tap(find.byType(FloatingActionButton));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 2));
      expect(find.byType(PostCardWidget), findsNWidgets(3));
      expect(find.widgetWithText(PostCardWidget, "Title 1"), findsNWidgets(1));
    });
  });
}
