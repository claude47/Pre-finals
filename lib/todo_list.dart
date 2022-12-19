import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}


class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    getData();
  }


  List lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO LIST'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                final item = lists[index] as Map;

                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(item['title']),
                  subtitle: Text(item['body']),
                  trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'edit')
                        {
                          editItem(item);
                        }
                        else if (value == 'delete')
                        {

                        }
                      },
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('edit'),),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('delete'),)
                        ];
                      }
                  ),
                );
              })
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: addOne,
        child: const Icon(Icons.add),
      ),


    );
  }

  void addOne() {
    final route = MaterialPageRoute(builder: (context) => const AddTodo(),);
    Navigator.push(context, route);
  }

  void editItem(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddTodo(
        todo:item,
        items:lists
    ),);
    await Navigator.push(context, route);
    getData();
  }

  Future<void> getData() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      setState(() {
        lists = json;
      });
    }
    else
    {
    }

  }
}
