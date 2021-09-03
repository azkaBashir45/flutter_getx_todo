import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:getxtodoapp/controller/todo_controller.dart';
import 'package:getxtodoapp/model/Todo.dart';

class TodoScreen extends StatelessWidget {
  final MyController myController = Get.find();
//for editing screen
  final int? index;
  TodoScreen({this.index});

  //inside portion for editing
  @override
  Widget build(BuildContext context) {
    //editintg
    String text = '';

    if (!this.index.isNull) {
      text = myController.todos[index!].text;
    }
    //inside
    // simple add TextEditingController textEditingController = TextEditingController();
    //editing
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'What do you want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text('Cancel'),
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                ),
                RaisedButton(
                  // add child: Text('Add'),
                  //editing
                  child: Text(this.index.isNull ? 'Add' : 'Edit'),
                  color: Colors.green,
                  onPressed: () {
                    // add myController.todos
                    //     .add(Todo(text: textEditingController.text));
                    //editing
                    if (this.index.isNull) {
                      myController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                      var editing = myController.todos[index!];
                      editing.text = textEditingController.text;
                      myController.todos[index!] = editing;
                    }
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
