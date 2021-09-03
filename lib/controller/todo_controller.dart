import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxtodoapp/model/Todo.dart';

class MyController extends GetxController {
  // ignore: top_level_function_literal_block
  var todos = <Todo>[].obs;

  //storage
  @override
  void onInit() {
    // TODO: implement onInit
    List? storeTodos = GetStorage().read<List>('todos');
    if (!storeTodos.isNull) {
      todos = storeTodos!.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
