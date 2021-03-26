import 'package:aula_13/app/modules/home/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HomeStore store;

  setUp(() {
    store = HomeStore();
  });

  group('HomeStore Test', () {
    test("First Test", () {
      expect(store, isInstanceOf<HomeStore>());
    });

    test('Value initiliazed', () {
      expect(store.counter, 0);
    });

    test('Increment value', () {
      store.increment();
      expect(store.counter, 1);
    });
  });
}
