import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/pages/add_todo.dart';
import 'package:todolist_app/pages/todo_list.dart';
import 'package:todolist_app/provider/todo_provider_list.dart';
import 'package:todolist_app/provider/theme_provider.dart';

import 'pages/splash_screen_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(ThemeData(), ThemeType.Dark)),
        ChangeNotifierProvider(create: (_) => TodoListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: themeProvider.themeData,
          darkTheme: themeProvider.themeData,
          initialRoute: '/',
          routes: {
            '/': (_) => const SplashScreen(),
            '/todo-list': (_) => const TodoList(),
            '/add-todo-screen': (_) => const AddTodo(),
          },
        );
      },
    );
  }
}
