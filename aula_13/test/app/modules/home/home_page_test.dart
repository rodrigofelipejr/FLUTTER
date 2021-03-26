import 'package:aula_13/app/modules/home/home_module.dart';
import 'package:aula_13/app/modules/home/home_page.dart';
import 'package:aula_13/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

import 'package:flutter_test/flutter_test.dart';

main() {
  initModule(HomeModule(), replaceBinds: [
    Bind.instance<HomeStore>(HomeStore()),
  ]);

  group('Home Page', () {
    testWidgets('HomePage initialized', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(
            title: "Home",
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('COUNT'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('HomePage Incremented', (WidgetTester tester) async {
      final store = Modular.get<HomeStore>();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(
            title: 'Home',
          ),
        ),
      );
      store.increment();
      expect(store.counter, 1);
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
