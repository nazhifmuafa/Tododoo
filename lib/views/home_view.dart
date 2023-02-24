import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tododoo/controller/home_controller.dart';
import 'package:tododoo/controller/login_controller.dart';
import 'package:tododoo/views/addTask_view.dart';
import 'package:tododoo/views/updateTask_view.dart';

import '../constant.dart';
import '../main.dart';

class HomeView extends StatelessWidget {
  var controller = Get.put<HomeController>(HomeController());
  var loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTask();
            }));
          },
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: customYellow,
        ),
        backgroundColor: const Color(0xFFF4F6FD),
        //create to do list
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //hamburger icon
                  Container(
                    child: IconButton(
                        alignment: Alignment(-10, 0),
                        splashColor: customGrey,
                        onPressed: (() {
                          z.toggle!();
                        }),
                        icon: Icon(Icons.menu_rounded,
                            color: customGrey, size: 30)),
                  ),
                  //search icon
                  Container(
                    child: IconButton(
                        alignment: Alignment(10, 0),
                        onPressed: (() {}),
                        icon: Icon(Icons.search_rounded,
                            color: customGrey, size: 30)),
                  )
                ],
              ),
            ),
            Text(
              "Whats'up",
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: customBlack),
            ),
            Text(
              loginController.user.value.nama!,
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: customYellow),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   "CATEGORIES",
            //   style: GoogleFonts.poppins(
            //       fontSize: 12, fontWeight: FontWeight.w600, color: customGrey),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "TASK",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600, color: customGrey),
            ),
            Obx(() => controller.isFetching.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListTask())
          ],
        ));
  }
}

class ListTask extends StatelessWidget {
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return controller.model!.data!.isEmpty
        ? //rounded cotainer
        Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: customGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Task",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: customBlack.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "You have no task today",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: customBlack.withOpacity(0.5)),
                ),
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model!.data!.length,
            itemBuilder: (context, index) {
              var data = controller.model!.data![index];
              print(data);
              return Dismissible(
                background: Container(),
                secondaryBackground: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.fromLTRB(5, 20, 20, 20),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ),
                key: Key(data.idTask.toString()),
                onDismissed: (direction) {
                  controller.deleteData(data);
                  print(data.idTask);
                },
                direction: DismissDirection.endToStart,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.fromLTRB(5, 20, 20, 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateTask(
                                    item: data,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                data.status = !data.status!;
                                controller.updateData(data);
                                print(data.status);
                              },
                              icon: data.status! == false
                                  ? Icon(
                                      Icons.circle_outlined,
                                      color: customYellow,
                                      size: 24,
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: customPurple.withOpacity(0.3),
                                      size: 24,
                                    )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            controller.model!.data![index].name!,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: data.status! == false
                                    ? customBlack
                                    : customBlack.withOpacity(0.3),
                                decoration: data.status! == false
                                    ? TextDecoration.none
                                    : TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
