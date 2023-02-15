import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/todo_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<TodoModel> todos = <TodoModel>[
    TodoModel(title: 'Tarefa 1'),
    TodoModel(title: 'Tarefa 2'),
    TodoModel(title: 'Tarefa 3'),
  ].asObservable();

  @action
  void setTodos(List<TodoModel> values) {
    todos = values.asObservable();
  }

  @action
  void conclude(int index) {
    var todo = todos[index];
    todo.active = !todo.active;

    todos = todos.map((e) => e == todo ? todo : e).toList().asObservable();
  }

  void goToDetail(TodoModel todo) =>
      Modular.to.pushNamed('detail', arguments: todo);
}
