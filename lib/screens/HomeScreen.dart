import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'TodoScreen.dart';
import 'package:getxtodoapp/controller/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(TodoScreen());
          },
        ),
        body: Container(
            child: Obx(() => ListView.separated(
                //without storage and dismissiable
                // itemBuilder: (context, index) => ListTile(
                //       title: Text(
                //         myController.todos[index].text,
                //         style: (myController.todos[index].isDone)
                //             ? TextStyle(
                //                 color: Colors.red,
                //                 decoration: TextDecoration.lineThrough)
                //             : TextStyle(
                //                 color: Theme.of(context)
                //                     .textTheme
                //                     .bodyText1!
                //                     .color),
                //       ),
                //       onTap: () {
                //         //for editing
                //         Get.to(TodoScreen(
                //           index: index,
                //         ));
                //         //inside the code
                //       },
                //       leading: Checkbox(
                //         value: myController.todos[index].isDone,
                //         onChanged: (v) {
                //           var changed = myController.todos[index];
                //           changed.isDone = v!;
                //           myController.todos[index] = changed;
                //         },
                //       ),
                //       trailing: Icon(Icons.chevron_right),
                //     ),
                // separatorBuilder: (_, __) => Divider(),
                // itemCount: myController.todos.length))));

//with dismissible and storage

                itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        var removed = myController.todos[index];
                        myController.todos.removeAt(index);
                        Get.snackbar('Task removed',
                            'The task "${removed.text}" was successfully removed.',
                            mainButton: TextButton(
                                child: Text(
                                  'Undo',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                onPressed: () {
                                  if (removed.isNull) {
                                    return;
                                  }
                                  myController.todos.insert(index, removed);
                                  // removed=null;
                                  // if (Get.isSnackbarOpen) {
                                  //   Get.back();
                                  // }
                                })

                            );
                      },
                      child: ListTile(
                        title: Text(
                          myController.todos[index].text,
                          style: (myController.todos[index].isDone)
                              ? TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                        ),
                        onTap: () {
                          //for editing
                          Get.to(TodoScreen(
                            index: index,
                          ));
                          //inside the code
                        },
                        leading: Checkbox(
                          value: myController.todos[index].isDone,
                          onChanged: (v) {
                            var changed = myController.todos[index];
                            changed.isDone = v!;
                            myController.todos[index] = changed;
                          },
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
                separatorBuilder: (_, __) => Divider(),
                itemCount: myController.todos.length))));

//           ListView.separated(
//               itemBuilder: (context, index) =>   ListTile(
//                       title: Text(todoController.todos[index].toString(),
//                           style: (todoController.todos[index].done)
//                               ? TextStyle(
//                                   color: Colors.red,
//                                   decoration: TextDecoration.lineThrough)
//                               : TextStyle(
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1!
//                                       .color)),
//                       onTap: () {
//                         Get.to(TodoScreen(
//                           index: index,
//                         ));
//                       },
//                       leading: Checkbox(
//                         value: todoController.todos[index].done,
//                         onChanged: (v) {
//                           var changed = todoController.todos[index];
//                           changed.done= v;
//                           todoController.todos[index] = changed;
//                         },
//                       ),
//                       trailing: Icon(Icons.chevron_right),
//                     ),
//                   ),

//         ));
//   }
// }

    // key: UniqueKey(),
    // onDismissed: (_) {
    // var removed = todoController.todos[index];
    // todoController.todos.removeAt(index);
    // Get.snackbar('Task removed',
    //     'The task "${removed.text}" was successfully removed.');
    // mainButton: FlatButton(
    //   child: Text('Undo'),
    //   onPressed: () {
    //     if (removed.isBlank) {
    //       return;
    //     }
    //     todoController.todos.insert(index, removed);
    //     removed = null;
    //     if (Get.isSnackbarOpen) {
    //       Get.back();
    //     }
    //   },
    // ));
    // },
  }
}
