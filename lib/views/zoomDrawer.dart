import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tododoo/constant.dart';
import 'package:tododoo/controller/login_controller.dart';
import 'package:tododoo/main.dart';
import 'package:tododoo/views/home_view.dart';
import 'package:tododoo/views/login_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      menuScreen: MenuScreen(),
      mainScreen: HomeView(),
      borderRadius: 24.0,
      showShadow: true,
      shadowLayer1Color: customYellow,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.easeInOut,
      closeCurve: Curves.bounceIn,
      menuBackgroundColor: Color(0xFF020417),
      androidCloseOnBackTap: true,
    );
  }
}

class MenuScreen extends StatelessWidget {
  var loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Color(0xFF020417),
        body: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      "FN",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    "To Do Doo",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "Fahrendra Khoirul Ihtada",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "200605110124",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Nazhif Muafa",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "200605110124",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  overflow: TextOverflow.clip,
                ),

                //create button logout
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                      loginController.logout();
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: customYellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
