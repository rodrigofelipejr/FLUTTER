import 'package:aula_10/app/modules/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late HomeController controller;

  setUp(() {
    controller = HomeController();
  });

  group('HomeController Test', () {
    test('Post is isEmpty', () {
      expect(controller.posts.value, isEmpty);
    });

    test('Post is NotEmpty', () async {
      await controller.getPosts();
      final posts = controller.posts.value.length;

      expect(posts, 3);
      expect(controller.posts.value[0].title, "Title 1");
    });
  });
}
