// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/todo_model.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final _textController = TextEditingController();
  final HomeController homeController;

  void _addName(name) {
    final todo = TodoModel(title: _textController.text, active: true);
    homeController.todos.add(todo);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).focusedChild?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo List'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(controller: _textController),
              ),
              Observer(builder: (_) {
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: homeController.todos.length,
                    itemBuilder: (context, index) {
                      final todo = homeController.todos[index];

                      return ListTile(
                        title: Text(todo.title),
                        onTap: () => homeController.goToDetail(todo),
                        trailing: IconButton(
                          onPressed: () {
                            homeController.todos.removeAt(index);
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                        ),
                        leading: Observer(builder: (_) {
                          return IconButton(
                              onPressed: () => homeController.conclude(index),
                              icon: todo.active
                                  ? const Icon(
                                      Icons.check_box,
                                      color: Colors.deepPurple,
                                    )
                                  : const Icon(Icons.check_box_outline_blank));
                        }),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addName(_textController.text),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
