import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tododoo/constant.dart';
import 'package:tododoo/controller/login_controller.dart';
import 'package:tododoo/views/zoomDrawer.dart';

import 'home_view.dart';

class LoginView extends StatelessWidget {
  var controller = Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          //login screen
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ToDoDoo",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Lets Organize, Be Productive",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: customGrey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.emailController.value,
                    decoration: InputDecoration(
                      //yellow borderside
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: customYellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //grey borderside
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: customGrey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('email',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.passwordController.value,
                    decoration: InputDecoration(
                      //yellow borderside
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: customYellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //grey borderside
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: customGrey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('password',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.login().then((value) {
                          if (value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            // snackbar failed login
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Login Failed"),
                            ));
                          }
                        });
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: customBlack),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: customYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
