import 'package:aula_03/shared/constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final _client = HasuraConnect(HASURA_URL);

  @override
  Future<List<Map>> getTarefas() async {
    final response = await _client.query('''
      query MyQuery {
        posts {
          id
          name
        }
      }    
    ''');

    return (response['data']['posts'] as List).map((e) => {'name': e['name']}).toList();
  }

  @override
  Stream streamTarefas() {
    // TODO: implement streamTarefas
    throw UnimplementedError();
  }

  streamTarefas2() async {
    String docSubscription = '''
    subscription{
      posts {
        id
        name
        photo
      }
    }
    ''';

    Snapshot snapshot = await _client.subscription(docSubscription);
    snapshot.listen((data) {
      print(data);
    }).onError((err) {
      print(err);
    });
  }
}
