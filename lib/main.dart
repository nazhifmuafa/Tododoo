import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:tododoo/views/login_view.dart';

final ZoomDrawerController z = ZoomDrawerController();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
