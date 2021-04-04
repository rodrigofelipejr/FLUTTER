import 'package:mobx_sample/stores/todo_store.dart';
import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
/*
 * coreState => observables
 * derivedStates => computeds
 */

  @observable
  String newTodoTitle = "";

  @action
  void changeNewTodoTitle(value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

/* 
 * Busca de mudanças no objeto/referência
 */

  // @observable
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    //todoList = List.from(todoList..add(newTodoTitle));
    todoList.insert(0, TodoStore(newTodoTitle));
    changeNewTodoTitle("");
  }
}
