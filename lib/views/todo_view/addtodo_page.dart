import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_todo/controllers/todo_controller.dart';
import 'package:get_todo/models/todo_model.dart';

import '../../dbs/dbs_operation.dart';

// ignore: must_be_immutable
class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);
  final TextEditingController taskController = TextEditingController();
  DbsOperation contactOperations = DbsOperation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task Page for some demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
            child: TextField(
              controller: taskController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Your Task',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final task = TodoData(task: taskController.text);
                    Get.find<TodoController>().insert(task);
                  },
                  child: const Text('Add'),
                )),
          )
        ],
      ),
    );
  }
}
