import 'package:aula_03/home/repositories/home_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepositoryImpl extends HomeRepository {
  CollectionReference get tarefas => FirebaseFirestore.instance.collection('/tarefas');

  @override
  Future<List<Map>> getTarefas() async {
    return (await tarefas.get()).docs.map((e) => {"name": e.data()!['name']}).toList();
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return tarefas.snapshots().map((e) => e.docs.map((e) => {"name": e.data()!['name']}).toList());
  }
}
