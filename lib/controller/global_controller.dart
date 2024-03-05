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
    } else if(locationPermission == LocationPermission.deniedForever){
        locationPermission = await Geolocator.requestPermission();
        if(locationPermission == LocationPermission.denied){
          return Future.error("Location permission is Denied");
        }
    }
    //get current location
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).
    then((value) {
            _lattitude.value = value.latitude;
            _longitude.value = value.longitude;
            _isLoading.value = false;
    });



  }

}

