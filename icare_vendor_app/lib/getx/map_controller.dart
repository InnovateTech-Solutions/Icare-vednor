/*import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find();
  GoogleMapController? mapController;
  var pos = ''.obs;

  static CameraPosition intialCameraPositin = const CameraPosition(
    target: LatLng(37.422131, -122.084801),
  );
  Set<Marker> markers = {};

  Future<Position> position() async {
    Position position = await determinePosition();
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14,
        ),
      ),
    );

    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId("currentLocation"),
      position: LatLng(position.latitude, position.longitude),
    ));
    updateMarkerPosition(position.latitude, position.longitude);
    print(position);
    pos.value = position.toString();
    return position;
  }
}

Future<Position> determinePosition() async {
  bool serviceEnable;
  LocationPermission permission;
  serviceEnable = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnable) {
    return Future.error('Location services are disable');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  return position;
}

void updateMarkerPosition(double latitude, double longitude) {}
*/