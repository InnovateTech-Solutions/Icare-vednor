import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/add_location.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

const kGoogleApiKey = 'AIzaSyBXjpgvW56b3tAk_fyw6Urr19FAxG4MMv8';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _MapWidgetState extends State<MapWidget> {
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 14.0);
  final AddLocation mapController = Get.put(AddLocation());

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: homeScaffoldKey,
      children: [
        Obx(
          () => GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: initialCameraPosition,
            markers: mapController.markersList.toSet(),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              mapController.googleMapController = controller;
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: ElevatedButton(
              onPressed: () => Get.back(), child: const Text("Add Coordinate")),
        ),
        Positioned(
          top: 30,
          child: ElevatedButton(
              onPressed: () {
                mapController.handlePressButton(context);
              },
              child: const Text("Search Places")),
        )
      ],
    );
  }
}
