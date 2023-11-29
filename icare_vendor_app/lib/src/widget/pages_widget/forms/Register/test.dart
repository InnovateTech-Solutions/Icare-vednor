import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
/*

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class filePicker extends StatefulWidget {
  const filePicker({super.key});

  @override
  State<filePicker> createState() => _filePickerState();
}

class _filePickerState extends State<filePicker> {
  TextEditingController filePathController = TextEditingController();
  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, // You can specify the file type you want to pick
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'txt'
      ], // Example file extensions
    );

    if (result != null) {
      String filePath = result.files.first.path!;
      filePathController.text = filePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text("Open File Picker"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/src/widget/pages_widget/forms/Register/profile_details.dart';

import '../../../../getx/register_controller.dart';

class FlutterSteps extends StatefulWidget {
  const FlutterSteps({Key? key}) : super(key: key);

  @override
  State<FlutterSteps> createState() => _FlutterStepsState();
}

class _FlutterStepsState extends State<FlutterSteps> {
  int currentStep = 0;
  bool isCompleted = false; //check completeness of inputs
  //form object to be used for form validation

  //sender details
  final senderName = TextEditingController();
  final senderAddress = TextEditingController();

  //receiver details
  final receiverName = TextEditingController();
  final receiverAddress = TextEditingController();
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Steps'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.teal)),
        child: Form(
          key: controller.profileFormkey,
          child: Stepper(
            steps: getSteps(),
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              controller.profileFormkey.currentState!.validate();
              bool isDetailValid =
                  isDetailComplete(); //this check if ok to move on to next screen

              if (isDetailValid) {
                if (isLastStep) {
                  setState(() {
                    isCompleted = true;
                  });
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              }
            },
            onStepCancel: () {
              if (currentStep == 0) {
                null;
              } else {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  bool isDetailComplete() {
    if (currentStep == 0) {
      //check sender fields
      if (senderName.text.isEmpty || senderAddress.text.isEmpty) {
        return false;
      } else {
        return true; //if all fields are not empty
      }
    } else if (currentStep == 1) {
      //check receiver fields
      if (receiverName.text.isEmpty || receiverAddress.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  //This will be your screens
  List<Step> getSteps() => [
        Step(
            title: const Text('Sender'),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: const ProfileDetailsWidget()),
        Step(
            title: const Text('Receiver'),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Receiver Name'),
                  controller: receiverName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "*Required.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Receiver Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "*Required.";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: const Column(
            children: [Text('Information Complete!')],
          ),
        )
      ];
}
*/
/*
import 'package:flutter/material.dart';

class CheckConditionBeforeNavigatingBack extends StatefulWidget {
  @override
  _CheckConditionBeforeNavigatingBackState createState() =>
      _CheckConditionBeforeNavigatingBackState();
}

class _CheckConditionBeforeNavigatingBackState
    extends State<CheckConditionBeforeNavigatingBack> {
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _canPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WillPopScope Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This route can be popped only if the condition is met.',
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _canPop = true;
                  });
                },
                child: Text("Set condition to true"),
              ),
            ],
          ),
        ),
      ),
    );
  }
// }
// */
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../../constant/app_constant.dart';
// import '../../../../constant/color.dart';
// import '../../../../getx/map_controller.dart';
// import '../../../../getx/profile_controller.dart';
// import '../../../../getx/register_controller.dart';
// import '../../../../model/login_model.dart';
// import '../../../constant_widget/sizes/sized_box.dart';
// import '../../../custom_widget.dart/form_widget.dart';
// import '../../../text_widget/form_text.dart';

// final registerController = Get.put(RegisterController());
// final profileController = Get.put(ProfileController());

// void showDialoge(BuildContext context) {
//   showGeneralDialog(
//     barrierLabel: "Label",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: const Duration(milliseconds: 700),
//     context: context,
//     pageBuilder: (context, anim1, anim2) {
//       return SizedBox(
//         height: 300,
//         child: Form(
//           key: profileController.formkey,
//           child: SizedBox(
//             width: 250.w,
//             height: 270.h,
//             child: ListView(
//               children: [
//                 FormText.textFieldLabel(AppConst.phoneNumber),
//                 FormWidget(
//                     login: Login(
//                         controller: registerController.phoneNumber,
//                         enableText: false,
//                         hintText: AppConst.phoneNumber,
//                         icon: const Icon(Icons.phone),
//                         invisible: false,
//                         validator: (number) =>
//                             registerController.validPhoneNumber(number),
//                         onTap: () {},
//                         type: TextInputType.phone,
//                         inputFormat: [registerController.maskFormatterPhone]),
//                     color: ColorConstants.mainScaffoldBackgroundColor),
//                 AppSizes.xsmallHeightSizedBox,
//                 FormText.textFieldLabel("Address"),
//                 FormWidget(
//                     login: Login(
//                         controller: registerController.address,
//                         enableText: false,
//                         hintText: "Address",
//                         icon: const Icon(Icons.location_city),
//                         invisible: false,
//                         validator: (address) =>
//                             registerController.validateAddress(),
//                         onTap: () {},
//                         type: TextInputType.text,
//                         inputFormat: null),
//                     color: ColorConstants.mainScaffoldBackgroundColor),
//                 AppSizes.xsmallHeightSizedBox,
//                 FormText.textFieldLabel(AppConst.email),
//                 FormWidget(
//                     login: Login(
//                         controller: registerController.email,
//                         enableText: false,
//                         hintText: AppConst.email,
//                         icon: const Icon(Icons.email),
//                         invisible: false,
//                         validator: (email) =>
//                             registerController.validateEmail(email),
//                         onTap: () {},
//                         type: TextInputType.emailAddress,
//                         inputFormat: null),
//                     color: ColorConstants.mainScaffoldBackgroundColor)
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return SlideTransition(
//         position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
//             .animate(anim1),
//         child: child,
//       );
//     },
//   );
// }
