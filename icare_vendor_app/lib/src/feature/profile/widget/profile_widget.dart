import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/feature/profile/widget/contact_dialog.dart';

import '../../../core/constant/color.dart';
import '../model/profile_model.dart';
import '../../review/view/review_page.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/widget/text_widget/profile_text.dart';
import 'header_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    List<ProfileModel> profile = [
      ProfileModel(
          title: "Contact Information",
          onTap: () {
            showDialoge(context);
          }),
      ProfileModel(
          title: "Review & Rating",
          onTap: () {
            Get.to(const ReviewPage());
          }),
      ProfileModel(title: "Location", onTap: () {}),
      ProfileModel(title: "Date & Time", onTap: () {}),
    ];

    return Column(
      children: [
        headerWidget(),
        Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
              color: AppColor.mainScaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15.0.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.r,
                    blurRadius: 3.r,
                    offset: const Offset(0, 2)),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                //vendor name
                ProfileText.mainProfileText(
                    "Dr.Lamya's Laser Specialist Dental Center Muharraq"),
                AppSizes.xsmallHeightSizedBox,
                //vendor description
                ProfileText.secProfileText(
                    "We are the first Laser Specialist Dental Center in the Kingdom of Bahrain"),
                AppSizes.smallHeightSizedBox,
                ElevatedButton(
                    onPressed: () => AuthenticationRepository().logout(),
                    child: Text('data')),

                SizedBox(
                  width: 350.w,
                  height: 160.h,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return ConstantWidget.profileList(profile[index]);
                      }),
                      separatorBuilder: ((context, index) {
                        return AppSizes.smallHeightSizedBox;
                      }),
                      itemCount: profile.length),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
