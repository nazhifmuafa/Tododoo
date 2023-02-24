import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododoo/constant.dart';
import 'package:tododoo/models/login_model.dart';

class LoginController extends GetxController {
  //textcontroller
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var user = Data().obs;

  var isLogin = false.obs;
  User? model;

  Future<bool> login() async {
    Dio dio = Dio();
    var res = await dio.get("http://${ipAPI}:3000/login");

    User model = User.fromJson(res.data);
    model.data!.forEach((element) {
      if (element.email == emailController.value.text &&
          element.password == passwordController.value.text) {
        isLogin.value = true;
        user.value = element;
      }
    });
    print("LOGIN : ${isLogin.value}");
    cleanController();
    return isLogin.value;
  }

  void logout() {
    isLogin.value = false;
    cleanController();
  }

  //clean controller
  void cleanController() {
    emailController.value.text = "";
    passwordController.value.text = "";
  }
}
