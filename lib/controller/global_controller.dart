import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController{

  //Create Various Variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //initial for them to be called

   RxBool checkLoading() => _isLoading;
   RxDouble getlattitude()=>_lattitude;
   RxDouble getlongitude()=>_longitude;

   @override
  void onInit() {
    // TODO: implement onInit
     if(_isLoading.isTrue){
       getLocation();
     }
     super.onInit();
  }

  getLocation() async{
    bool isServiceEnabled;

    LocationPermission  locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled){
      return Future.error("Location not Enabled");
    }

    //satus of permission

    locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location Permission Denied forever");
    }
  }

}

