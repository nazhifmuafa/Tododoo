import 'package:intl/intl.dart';

class TaskModel {
  bool? success;
  String? message;
  List<Data>? data;

  TaskModel({this.success, this.message, this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idTask;
  int? idTasksetting;
  String? name;
  String? description;
  DateTime? createAt;
  bool? status;
  String? category;
  DateTime? dueDate;
  String? priority;
  DateTime? reminder;
  String? repeatTask;

  Data(
      {this.idTask,
      this.idTasksetting,
      this.name,
      this.description,
      this.createAt,
      this.status,
      this.category,
      this.dueDate,
      this.priority,
      this.reminder,
      this.repeatTask});

  Data.fromJson(Map<String, dynamic> json) {
    idTask = json['id_task'];
    idTasksetting = json['id_tasksetting'];
    name = json['name'];
    description = json['description'];
    createAt = DateTime.parse(json['create_at']);
    status = json['status'].toString() == "1" ? true : false;
    category = json['category'];
    dueDate = DateTime.parse(json['due_date']);
    priority = json['priority'];
    reminder = DateTime.parse(json['reminder']);
    repeatTask = json['repeat_task'];
  }

  Map<String, dynamic> toJson() {
    final f = DateFormat('yyyy-MM-dd hh:mm:ss');
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_task'] = idTask;
    data['id_tasksetting'] = idTasksetting;
    data['name'] = name;
    data['description'] = description;
    data['create_at'] = f.format(createAt!);
    data['status'] = status;
    data['category'] = category;
    data['due_date'] = f.format(dueDate!);
    data['priority'] = priority;
    data['reminder'] = f.format(reminder!);
    data['repeat_task'] = repeatTask;
    return data;
  }
}
