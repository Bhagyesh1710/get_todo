import 'package:get/get.dart';
import 'package:get_todo/models/todo_model.dart';
import 'package:get_todo/routes/app_routes_name.dart';
import '../dbs/dbs_operation.dart';
import '../services/shared_prefrence_service.dart';

class TodoController extends GetxController {
  Future<List<TodoData>>? todoList;
  var todoData = <TodoData>[].obs;
  RxBool isLoading = false.obs;

  DbsOperation contactOperations = DbsOperation();
  final PrefService prefService = PrefService();

  @override
  void onInit() {
    readData();
    super.onInit();
  }

  void insert(TodoData todoData) {
    contactOperations.createTodo(todoData);
    readData();
    Get.back();
  }

  readData() async {
    todoList = contactOperations.getAllTodos();
    final arr = (await todoList) ?? [];
    todoData.value = arr;
    isLoading.value = true;
  }

  updateData(TodoData todoData) async {
    contactOperations.updateTodo(TodoData(
      task: todoData.task,
      doneTask: todoData.doneTask,
      id: todoData.id,
    ));
    readData();
  }

  deleteTodo(int id) async {
    contactOperations.deleteTodo(id);
    readData();
  }

  logOut() {
    prefService
        .removeCache("userData")
        .whenComplete(() => {Get.offNamed(kLoginPage)});
  }
}
