import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/todo_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ChaneNotifiyProvider
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
