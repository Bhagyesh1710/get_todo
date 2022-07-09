class TodoData {
  int? id;
  String? task;
  int? doneTask;

  TodoData({this.id, this.task, this.doneTask = 0});
  TodoData.fromMap(dynamic obj) {
    id = obj['id'];
    task = obj['task'];
    doneTask = obj['doneTask'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'task': task,
      'doneTask': doneTask,
    };
    return map;
  }
}
