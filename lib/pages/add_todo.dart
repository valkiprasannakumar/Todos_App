import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/provider/todo_provider_list.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titlecontroller = TextEditingController();

  final subtitlecontroller = TextEditingController();

  @override
  void dispose() {
    titlecontroller.dispose();
    subtitlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var todosProvider = Provider.of<TodoListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titlecontroller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: subtitlecontroller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'SubTitle',
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                todosProvider.addTodo(
                    titlecontroller.text, subtitlecontroller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
