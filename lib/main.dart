import 'package:flutter/material.dart';
import 'todo_list.dart';



void main() {
  runApp(MaterialApp(
    title: 'semi finals',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home:  const TodoList(),
  ));
}
