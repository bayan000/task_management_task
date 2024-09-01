import 'package:get/get.dart';
import 'package:tasks_mangament_task/task_model.dart';

class TaskController extends GetxController {
  final RxList<Task> tasks = RxList<Task>([]);

  void addTask(String title) {
    tasks.add(Task(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title,isCompleted: false));
    update();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    update();
  }

  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    print(tasks[index].isCompleted);
    update();
  }


}