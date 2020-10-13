import 'package:exemple_mobx/Stores/todo_store.dart';
import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{

  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String newValue) => newTodoTitle = newValue;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo(){
    todoList.insert(0,TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

}