import 'package:flutter/material.dart';
import 'package:flutter_todo_scoped_model/model/todos.dart';
import 'package:scoped_model/scoped_model.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTodosPage(),
    );
  }

  _buildTodosPage() {
    return ScopedModel<Todos>(
      model: Todos(),
      child: _buildTodosContent(),
    );
  }

  _buildTodosContent() {
    return ScopedModelDescendant<Todos>(
      builder: (context, child, model) {
        return ListView.builder(
          itemCount: model.todosCount,
          itemBuilder: (context, index) {
            return _buildTodoItem(model, index);
          },
        );
      },
    );
  }

  _buildTodoItem(Todos model, int index) {
    return ListTile(
      title: Text(model.todos[index].title),
    );
  }
}