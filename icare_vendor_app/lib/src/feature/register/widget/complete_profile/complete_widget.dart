import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/constant/sized_box.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/button_widget.dart';
import 'package:icare_vendor_app/src/feature/register/widget/complete_profile/file_widget.dart';
import 'package:icare_vendor_app/src/feature/register/widget/complete_profile/working_details.dart';

import '../../controller/add_location_controller.dart';
import 'google_map_widget.dart';
import 'info_widget.dart';

class CompleteProfileWidget extends StatefulWidget {
  const CompleteProfileWidget({
    super.key,
  });

  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget> {
  final mapController = Get.put(AddLocation());

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
    return Center(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  InfoWidget(),
                  GoogleMapWidget(),
                  WorkignDetailsWidget(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150.w,
                  height: 56.h,
                  child: ButtonWidget(
                      onTap: () => {
                            controller.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            )
                          },
                      color: AppColor.mainScaffoldBackgroundColor,
                      tilte: "Back"),
                ),
                SizedBox(
                  width: 150.w,
                  height: 56.h,
                  child: ButtonWidget(
                      onTap: () => {
                            controller.continued(VendorModel(
                                status: false,
                                username: controller.vendorName.text.trim(),
                                password: controller.password.text.trim(),
                                email: controller.email.text.trim(),
                                phoneNumber: controller.phoneNumber.text.trim(),
                                businessLicense:
                                    controller.pdfController.filePath.value,
                                businesImage:
                                    controller.imageController.imagePath.value!,
                                category: controller.selectedCategory!,
                                decription: controller.description.text.trim(),
                                coordanits: controller
                                    .coordinatesController.coordinate.text
                                    .trim(),
                                opendayes:
                                    controller.dayController.selectedContainers,
                                openClose:
                                    '${controller.closeHour.text.trim()} - ${controller.operHour.text.trim()}',
                                address: controller
                                    .coordinatesController.address.value))
                          },
                      color: AppColor.mainTextColor,
                      tilte: "Next"),
                ),
              ],
            ),
          ),
          AppSizes.mediumHeightSizedBox,
        ],
      ),
    );
  }
}
