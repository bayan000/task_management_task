import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_mangament_task/task_controller.dart';
import 'package:tasks_mangament_task/task_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("it's good in main");
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: TaskList(),
    );
  }
}