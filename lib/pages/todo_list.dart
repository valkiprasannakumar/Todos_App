import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/provider/theme_provider.dart';
import 'package:todolist_app/provider/todo_provider_list.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var todosProvider = Provider.of<TodoListProvider>(context);
    var todos = todosProvider.todos;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-screen');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(todos[index].title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(todos[index].subtitle),
                trailing: IconButton(
                    onPressed: () {
                      todosProvider.removeTodo(index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            ),
          );
        },
      ),
    );
  }
}
