import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/widget/text_widget/form_text.dart';

import '../../controller/add_location_controller.dart';

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
  void initState() {
    initializeMap();

    super.initState();
  }

  void initializeMap() async {
    await mapController.addCustomMarker();
    await mapController.loadMapStyle();
    // await mapController.handlePressButton(context);
  }

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
            onMapCreated: (GoogleMapController controller) async {
              await controller.setMapStyle(mapController.mapStyleString);
              mapController.googleMapController = controller;
            },
          ),
        ),
        Positioned(
          left: 30.w,
          right: 30.w,
          top: 30.h,
          child: GestureDetector(
              onTap: () {
                mapController.handlePressButton(context);
              },
              child: Container(
                  width: 200.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.mainTextColor),
                      color: AppColor.mainScaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                    child: FormText.textFieldLabel(
                      "Search Address",
                    ),
                  ))),
        )
      ],
    );
  }
}
