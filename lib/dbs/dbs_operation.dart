import 'package:flutter/material.dart';
import 'package:get_todo/dbs/dbs.dart';
import 'package:get_todo/models/todo_model.dart';

class DbsOperation {
  DbHelper dbHelper = DbHelper.instance;

  //insert TodoDetails
  createTodo(TodoData todoData) async {
    final db = await dbHelper.database;
    debugPrint(todoData.task);
    db.insert('todo', todoData.toMap());
    debugPrint('Data Inserted');
  }

  //read all ToDoTask
  Future<List<TodoData>> getAllTodos() async {
    final db = await dbHelper.database;
    var allData = await db.query('todo');
    List<TodoData> todoDataModel =
        allData.map((todoData) => TodoData.fromMap(todoData)).toList();
    debugPrint(todoDataModel.toString());
    return todoDataModel;
  }

  //Update TodoDetail
  updateTodo(TodoData todoData) async {
    final db = await dbHelper.database;
    db.update(
      'todo',
      todoData.toMap(),
      where: 'id = ?',
      whereArgs: [todoData.id],
    );
  }

  //delete todoTask
  deleteTodo(int id) async {
    final db = await dbHelper.database;
    db.delete('todo', where: 'id = ?', whereArgs: [id]);
  }
}
