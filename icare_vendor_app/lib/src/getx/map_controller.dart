import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../widget/pages_widget/forms/Register/map_widget.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find();
  GoogleMapController? mapController;
  final coordinate = TextEditingController();
  static CameraPosition intialCameraPositin = const CameraPosition(
    target: LatLng(37.422131, -122.084801),
  );
  Set<Marker> markers = {};
  final markersList = <Marker>[].obs;
  late GoogleMapController googleMapController;
  final Mode mode = Mode.overlay;

//permission
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

  Future<(double, double)> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    final coordinates = (lat, lng);
    markersList.clear();
    markersList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

    coordinate.text = coordinates.toString();
    return coordinates;
  }

  //validation
  bool validateCoordinate(String coordinate) {
    List<String> parts = coordinate.split(',');
    if (parts.length != 2) {
      return false;
    }

    try {
      double latitude = double.parse(parts[0].trim());
      double longitude = double.parse(parts[1].trim());

      if (latitude >= -90.0 &&
          latitude <= 90.0 &&
          longitude >= -180.0 &&
          longitude <= 180.0) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  Future<void> handlePressButton(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [
          Component(Component.country, "pk"),
          Component(Component.country, "uk")
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }
}
