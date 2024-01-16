import 'package:flutter/material.dart';
import 'package:icare_vendor_app/src/feature/register/widget/widget_collection/add_location.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.876,
            child: const MapWidget()),
        // Positioned(
        //   bottom: 10.h,
        //   child: SizedBox(
        //     width: 327.w,
        //     height: 56.h,
        //     child: ButtonWidget(
        //       onTap: () => {
        //         Get.to(
        //           const InfoPage(),
        //         )
        //       },
        //       tilte: "Next",
        //       color: AppColor.mainTextColor,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
