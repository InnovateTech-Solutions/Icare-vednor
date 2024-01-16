import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/constant/sized_box.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_image.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_pdf.dart';
import 'package:icare_vendor_app/src/feature/register/controller/register_controller.dart';
import 'package:icare_vendor_app/src/feature/register/widget/text/register_text.dart';

final controller = Get.put(RegisterController());
final imageController = Get.put(AddImage());
final fileController = Get.put(AddPdf());
fileContainer() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 7.w,
              height: 7.h,
              decoration: BoxDecoration(
                  color: AppColor.blackColor, shape: BoxShape.circle),
            ),
            AppSizes.xsmallWidthSizedBox,
            GestureDetector(
              onTap: () {
                fileController.fileExpanded();
              },
              child: RegisterText.secText("Business License"),
            ),
          ],
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              fileController.uploadFile();
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: fileController.isFile.value == false ? 0.w : 327.w,
                height: fileController.isFile.value == false ? 0.w : 177.w,
                decoration: BoxDecoration(
                    color: AppColor.formColor,
                    border: Border.all(color: AppColor.boarderColor),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Obx(
                  () => Center(
                      child: fileController.filePath.value == ''
                          ? SvgPicture.asset(
                              "assets/image/upload.svg",
                              width: 50.w,
                            )
                          : Image.network(
                              'https://cdn-icons-png.flaticon.com/512/3997/3997608.png',
                              width: 50.w,
                            )),
                )),
          ),
        ),
      ],
    ),
  );
}

imageContainer() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 7.w,
              height: 7.h,
              decoration: BoxDecoration(
                  color: AppColor.blackColor, shape: BoxShape.circle),
            ),
            AppSizes.xsmallWidthSizedBox,
            GestureDetector(
              onTap: () {
                imageController.imageExpanded();
              },
              child: RegisterText.secText(
                "Business Image",
              ),
            ),
          ],
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              imageController.pickImage();
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: imageController.isImage.value == false ? 0.w : 327.w,
                height: imageController.isImage.value == false ? 0.w : 177.w,
                decoration: BoxDecoration(
                    color: AppColor.formColor,
                    border: Border.all(color: AppColor.boarderColor),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Obx(
                  () => Center(
                      child: imageController.imagePath.value == null
                          ? SvgPicture.asset(
                              "assets/image/upload.svg",
                              width: 50.w,
                            )
                          : SvgPicture.asset(
                              'assets/image/imageIcon.svg',
                              width: 50.w,
                            )),
                )),
          ),
        ),
      ],
    ),
  );
}
