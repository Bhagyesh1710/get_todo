import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_todo/controllers/todo_controller.dart';
import 'package:get_todo/dbs/dbs_operation.dart';
import 'package:get_todo/models/todo_model.dart';
import 'package:get_todo/routes/app_routes_name.dart';

// ignore: must_be_immutable
class TodoHomePage extends StatelessWidget {
  TodoHomePage({Key? key}) : super(key: key);
  DbsOperation contactOperations = DbsOperation();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<TodoController>(() => TodoController());
    TodoController todoController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Task Page'),
        actions: [
          IconButton(
              onPressed: () {
                todoController.logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        return todoController.isLoading.value == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Data Loading'),
                  ],
                ),
              )
            : todoController.todoData.isEmpty
                ? const Center(
                    child: Text('No Task Added'),
                  )
                : ListView.builder(
                    itemCount: todoController.todoData.length,
                    itemBuilder: (context, index) {
                      var taskEdit = todoController.todoData[index].task;
                      TextEditingController taskEditController =
                          TextEditingController(text: taskEdit);
                      return ListTile(
                        title: Text(
                          todoController.todoData[index].task.toString(),
                          style: todoController.todoData[index].doneTask == 0
                              ? TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold)
                              : TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.85,
                                ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0.h, horizontal: 16.0.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Update Task',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.0.h,
                                                horizontal: 16.0.w),
                                            child: TextField(
                                              controller: taskEditController,
                                              keyboardType: TextInputType.name,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Name',
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                    value: (todoController
                                                                .todoData[index]
                                                                .doneTask ==
                                                            0
                                                        ? false
                                                        : true),
                                                    onChanged: (v) {
                                                      var change =
                                                          todoController
                                                              .todoData[index];
                                                      change.doneTask =
                                                          (v == true ? 1 : 0);
                                                      todoController
                                                              .todoData[index] =
                                                          change;
                                                    }),
                                              ),
                                              const Text('Task Done or Not')
                                            ],
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                todoController
                                                    .updateData(TodoData(
                                                  id: todoController
                                                      .todoData[index].id,
                                                  task: taskEditController.text,
                                                  doneTask: todoController
                                                      .todoData[index].doneTask,
                                                ));
                                                Get.back();
                                              },
                                              child: const Text('Update Task'))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Delete Task',
                                      content: const Text(
                                        'Are you sure you want to delete task?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      titleStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      cancel: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Cancel')),
                                      confirm: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                          ),
                                          onPressed: () {
                                            todoController.deleteTodo(
                                                todoController
                                                        .todoData[index].id ??
                                                    0);
                                            Get.back();
                                          },
                                          child: const Text('Delete')));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      );
                    });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(kAddTodoPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
