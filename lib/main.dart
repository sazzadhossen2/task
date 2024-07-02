import 'package:assign/presentation/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllerBinder.dart';

void main() {
  runApp(const EmployeeCreatorApp());
}

class EmployeeCreatorApp extends StatelessWidget {
  const EmployeeCreatorApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EmployeeCreatorScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}




