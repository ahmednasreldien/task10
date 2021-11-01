class Task {
  int? id;
  late final String taskName;
  bool isDone;
  DateTime ? doneTime;
  DateTime? dueDate;
  Task({required this.taskName, this.isDone = false,this.dueDate});
}