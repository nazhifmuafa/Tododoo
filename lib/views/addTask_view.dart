import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tododoo/controller/home_controller.dart';

import '../constant.dart';
import '../models/task_model.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F6FD),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF4F6FD),
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close_rounded, color: customBlack, size: 30))
          ],
          title: Text(
            "Create Task",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w700, color: customBlack),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => Container(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: ListView(
              children: [
                TextField(
                  cursorHeight: 40,
                  cursorColor: customYellow,
                  strutStyle: StrutStyle(height: 2),
                  textCapitalization: TextCapitalization.sentences,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: customBlack),
                  controller: controller.taskName.value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: Text('What are you planning?',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: customGrey)),
                  ),
                ),
                TextField(
                  cursorHeight: 40,
                  cursorColor: customYellow,
                  strutStyle: StrutStyle(height: 2),
                  textCapitalization: TextCapitalization.sentences,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: customBlack),
                  controller: controller.taskDescription.value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: Text('Description',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: customGrey)),
                  ),
                ),
                Divider(
                  height: 24,
                  color: customGrey.withOpacity(0.5),
                  thickness: 1,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      Icon(Icons.task_outlined, color: customYellow, size: 24),
                  minVerticalPadding: 0,
                  title: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.taskId.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('Id Task',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                    ),
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (homecontroller) => ListTile(
                    visualDensity: VisualDensity.compact,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.calendar_today_rounded,
                        color: customYellow, size: 24),
                    title: Obx(
                      () => Text(
                          controller.taskDueDate.value.text == ""
                              ? "Due Date"
                              : controller.taskDueDate.value.text,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: controller.taskDueDate.value.text == ""
                                  ? customGrey
                                  : customBlack)),
                    ),
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          theme: DatePickerTheme(
                            doneStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: customYellow),
                          ),
                          minTime: DateTime.now(),
                          maxTime: DateTime(2100, 12, 31), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        controller.taskDueDate.value.text =
                            date.year.toString() +
                                "-" +
                                date.month.toString() +
                                "-" +
                                date.day.toString();
                        print("ini controller DueDatae : " +
                            controller.taskDueDate.value.text);
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.local_offer_outlined,
                      color: customYellow, size: 24),
                  minVerticalPadding: 0,
                  title: TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.taskCategory.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('Category',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.priority_high_rounded,
                      color: customYellow, size: 24),
                  minVerticalPadding: 0,
                  title: TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.taskPriority.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('Priority',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                      // hintText: "Priority",
                      // hintStyle: GoogleFonts.poppins(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //     color: customGrey),
                    ),
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity.compact,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.notifications_active_outlined,
                      color: customYellow, size: 24),
                  title: Text(
                      controller.taskReminder.value.text == ""
                          ? "Reminder"
                          : controller.taskReminder.value.text,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: controller.taskReminder.value.text == ""
                              ? customGrey
                              : customBlack)),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        theme: DatePickerTheme(
                          doneStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: customYellow),
                        ),
                        minTime: DateTime.now(),
                        maxTime: DateTime(2100, 12, 31), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      controller.taskReminder.value.text =
                          date.year.toString() +
                              "-" +
                              date.month.toString() +
                              "-" +
                              date.day.toString();
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      Icon(Icons.repeat_rounded, color: customYellow, size: 24),
                  minVerticalPadding: 0,
                  title: TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: customYellow,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: customBlack),
                    controller: controller.taskRepeat.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text('Repeat Task',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: customGrey)),
                    ),
                  ),
                ),
                //create button
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: customYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      //check controlee if null
                      if (controller.taskName.value.text == "" ||
                          controller.taskDueDate.value.text == "" ||
                          controller.taskId.value.text == "" ||
                          controller.taskCategory.value.text == "" ||
                          controller.taskPriority.value.text == "" ||
                          controller.taskReminder.value.text == "" ||
                          controller.taskRepeat.value.text == "") {
                        //snackbar
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please fill all the field"),
                          backgroundColor: Colors.redAccent,
                        ));
                      } else {
                        //create task
                        Data newData = Data(
                            idTask: int.parse(controller.taskId.value.text),
                            idTasksetting:
                                int.parse(controller.taskId.value.text),
                            status: false,
                            createAt: DateTime.now(),
                            description: controller.taskDescription.value.text,
                            name: controller.taskName.value.text,
                            dueDate: DateFormat("yyyy-MM-dd")
                                .parse(controller.taskDueDate.value.text),
                            category: controller.taskCategory.value.text,
                            priority: controller.taskPriority.value.text,
                            reminder: DateFormat("yyyy-MM-dd")
                                .parse(controller.taskReminder.value.text),
                            repeatTask: controller.taskRepeat.value.text);
                        controller.addData(newData);
                        //close bottom sheet\
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Create",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: customBlack),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
