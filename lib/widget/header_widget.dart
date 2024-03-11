
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  String city = "";
  final GlobalController globalController =
  Get.put(GlobalController(),permanent:true);

  @override
  void initState() {
    getAddress(globalController.getlattitude().value, globalController.getlongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async{
   List<Placemark> placemark =  await placemarkFromCoordinates(lat, lon);
  Placemark place = placemark[0];
  setState(() {
    city = place.locality!;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(
                fontSize: 35,
                height: 2
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
          style: TextStyle(fontSize: 35, color: Colors.grey[700], height: 1.5),
          ),
        )
      ],
    );
  }
}
