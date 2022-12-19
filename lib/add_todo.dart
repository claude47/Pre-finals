import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final List? items;
  final Map? todo;
  const AddTodo({Key? key, this.items, this.todo}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool edit = false;
  @override
  void initState () {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      edit = true;
      final title = todo['title'];
      final details = todo['body'];
      titleController.text = title;
      descController.text = details;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(edit ? "Edit" : "Add"),
      ),

      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "title",
              ),
            ),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                hintText: "description",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(edit ? "save" : "save"),

            )
          ],
        ),
      ),
    );
  }

  Future<void> updateData() async {}
  Future<void> addData() async {}
  void successMessage(String Message) {}



}
