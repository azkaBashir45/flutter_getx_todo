import "package:flutter/material.dart";
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = '';
   
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
                  child: Text( 'Add'),
                  color: Colors.green,
                  onPressed: () {
                    
                      // todoController.todos.add(Todo(text: textEditingController.text));
                   

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
