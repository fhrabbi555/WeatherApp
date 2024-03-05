import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:weatherapp/controller/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//call global controller
  final GlobalController globalController =
      Get.put(GlobalController(),permanent:true);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
