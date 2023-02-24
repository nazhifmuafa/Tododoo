import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../models/task_model.dart';

class HomeController extends GetxController {
  //textcontroller
  var taskId = TextEditingController().obs;
  var taskName = TextEditingController().obs;
  var taskDescription = TextEditingController().obs;
  var taskCategory = TextEditingController().obs;
  var taskDueDate = TextEditingController().obs;
  var taskPriority = TextEditingController().obs;
  var taskReminder = TextEditingController().obs;
  var taskRepeat = TextEditingController().obs;

  var isFetching = true.obs;

  // default 10.0.2.2

  TaskModel? model;

  Future<TaskModel> ambilData() async {
    Dio dio = Dio();
    var res = await dio.get("http://${ipAPI}:3000/task");
    TaskModel model = TaskModel.fromJson(res.data);
    return model;
  }

  //updatedata
  Future<void> updateData(Data model) async {
    Dio dio = Dio();
    String data = jsonEncode(model);
    var res = await dio
        .post("http://${ipAPI}:3000/task/edit", data: data)
        .then((value) => print(value.data));
    print("UPDATE DATA : ${data.toString()}");
    fetchData();
    cleanController();
  }

  //delete data
  Future<void> deleteData(Data model) async {
    Dio dio = Dio();
    String data = jsonEncode(model);
    var res = await dio
        .post("http://${ipAPI}:3000/task/delete", data: data)
        .then((value) => print(value.data));
    print("DELETE DATA : ${data.toString()}");
    fetchData();
  }

  //add data
  Future<void> addData(Data model) async {
    Dio dio = Dio();
    String data = jsonEncode(model);
    var res = await dio
        .post("http://${ipAPI}:3000/task/add", data: data)
        .then((value) => print(value.data));
    print("ADD DATA : ${data.toString()}");
    fetchData();
    cleanController();
  }

  void fetchData() async {
    isFetching.value = true;
    model = await ambilData();
    isFetching.value = false;
    print(model!.data!.toList());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  //clean controller
  void cleanController() {
    taskId.value.text = "";
    taskName.value.text = "";
    taskDescription.value.text = "";
    taskCategory.value.text = "";
    taskDueDate.value.text = "";
    taskPriority.value.text = "";
    taskReminder.value.text = "";
    taskRepeat.value.text = "";
  }



  List<String> nama =[];

  //create forEach random number and add to nama
  void createRandomNumber() {
    for (int i = 0; i < 10; i++) {
      nama.add(i.toString());
    }
  } 
}
