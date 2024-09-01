import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_mangament_task/components_for%20tasks.dart';
import 'package:tasks_mangament_task/task_model.dart';
import 'package:tasks_mangament_task/task_controller.dart';

class TaskList extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController()); // Creating TaskController instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.check,color:  Colors.deepPurple,),
        title: const Text('Task Manager',style: TextStyle(color: Colors.deepPurple),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),

          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              TaskListWidget(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: FloatingActionButton(
                  onPressed: () => Get.dialog(AddTaskDialog()),
                  child: const Icon(Icons.add,color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TaskListWidget extends StatefulWidget {

  TaskListWidget({Key? key}) : super(key: key);

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget  build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 450,
      child: ListView.builder(
        itemCount: taskController.tasks.length,
        itemBuilder: (context, index) {
          final task = taskController.tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                fontSize: 16,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Checkbox(
                  value:task.isCompleted? true: false,
                  onChanged: (value) => {
                  print(task.isCompleted.toString() + "the status"),
                  taskController.toggleTaskCompletion(index),
                    setState((){})
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete,color: Colors.grey,),
                  onPressed: () => taskController.deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}