import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task_controller.dart';

class AddTaskDialog extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();

    return AlertDialog(
      title: const Text('Add Task'),
      content: TextField(
        controller: _titleController,
        decoration: const InputDecoration(hintText: 'Enter task title'),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            taskController.addTask(_titleController.text);
            Get.back();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}


/*
class TaskListWidget extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder( // Wrap ListView.builder with Obx
      itemCount: taskController.tasks.length,
      itemBuilder: (context, index) {
        final task = taskController.tasks[index];
        return ListTile(
          title: Text(task.title,
            style: task.isCompleted ? TextStyle(decoration: TextDecoration.lineThrough) : null,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: (value) => taskController.toggleTaskCompletion(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => taskController.deleteTask(index),
              ),
            ],
          ),
        );
      },
    ));
  }
}
*//*
class TaskListWidget extends StatelessWidget {
  // No need to create a new TaskController instance here
  final TaskController taskController;
  TaskListWidget(this.taskController); // Constructor with TaskController argument

  @override
  Widget build(BuildContext context) {
    //final taskController = Get.find<TaskController>(); // Access existing instance

    return Obx(() => ListView.builder( // Wrap ListView.builder with Obx
      itemCount: taskController.tasks.length,
      itemBuilder: (context, index) {
        final task = taskController.tasks[index];
        return ListTile(
          title: Text(task.title,
            style: task.isCompleted ? TextStyle(decoration: TextDecoration.lineThrough) : null,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: (value) => taskController.toggleTaskCompletion(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => taskController.deleteTask(index),
              ),
            ],
          ),
        );      },
    ));
  }
}*/