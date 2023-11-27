/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icare_vendor_app/getx/map_controller.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: mapController.markers,
          initialCameraPosition: const CameraPosition(
              target: LatLng(37.422131, -122.084801),
              tilt: 59.440717697143555,
              zoom: 10.5),
          onMapCreated: (controller) {
            mapController.mapController = controller;
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            mapController.position();
            print(mapController.pos);
          },
          label: textFieldLabel("Current location"),
          icon: const Icon(Icons.location_history),
        ),
      ),
    );
  }
}
*/