// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/todo_model.dart';

class TodoDetail extends StatelessWidget {
  const TodoDetail({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Text(todo.title),
      ),
    );
  }
}
