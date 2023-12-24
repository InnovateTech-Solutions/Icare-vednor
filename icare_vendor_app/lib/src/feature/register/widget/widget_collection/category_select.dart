import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';

class CategoerySelect extends StatefulWidget {
  const CategoerySelect({super.key});

  @override
  State<CategoerySelect> createState() => _CategoerySelectState();
}

class _CategoerySelectState extends State<CategoerySelect> {
  String? selectedCategory;

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
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.secondaryScaffoldBacground,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Center(
                    child: DropdownButton(
                      dropdownColor: AppColor.secondaryScaffoldBacground,
                      icon: Icon(
                        Icons.arrow_drop_down_circle_sharp,
                        color: AppColor.mainTextColor,
                      ),
                      hint: const Text('Select category'),
                      value: selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categoryTitles.map((title) {
                        return DropdownMenuItem(
                          value: title,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: AppColor.mainTextColor,
                                      fontWeight: FontWeight.w400)),
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
