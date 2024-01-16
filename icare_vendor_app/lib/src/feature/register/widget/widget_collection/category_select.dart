import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/feature/register/controller/register_controller.dart';

class CategoerySelect extends StatefulWidget {
  const CategoerySelect({super.key});

  @override
  State<CategoerySelect> createState() => _CategoerySelectState();
}

class _CategoerySelectState extends State<CategoerySelect> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Categories')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                List<DocumentSnapshot> categories = snapshot.data!.docs;

                List<String> categoryTitles =
                    categories.map((e) => e['Title'].toString()).toList();

                return Container(
                  padding: const EdgeInsets.all(10),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.boarderColor),
                      color: AppColor.formColor,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Center(
                    child: DropdownButton(
                      dropdownColor: AppColor.formColor,
                      icon: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColor.mainTextColor,
                      ),
                      hint: Text(
                        'Select category',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: const Color(0xffA1A8B0))),
                      ),
                      value: controller.selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          controller.selectedCategory = newValue;
                        });
                      },
                      items: categoryTitles.map((title) {
                        return DropdownMenuItem(
                          value: title,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              title,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.mainTextColor)),
                            ),
                          ),
                        );
                      }).toList(), // Remove the underline
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
