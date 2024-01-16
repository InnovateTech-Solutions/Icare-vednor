// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:icare_vendor_app/src/feature/register/controller/add_pdf.dart';
// import 'package:icare_vendor_app/src/feature/register/widget/widget_collection/category_select.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../core/constant/color.dart';
// import '../../../../core/constant/sized_box.dart';
// import '../../../../core/model/form_model.dart';
// import '../../../../core/widget/text_widget/form_text.dart';
// import '../../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
// import '../../controller/register_controller.dart';

// class PersonalDetailWidget extends StatefulWidget {
//   const PersonalDetailWidget({super.key});

//   @override
//   State<PersonalDetailWidget> createState() => _PersonalDetailWidgetState();
// }

// class _PersonalDetailWidgetState extends State<PersonalDetailWidget> {
//   final controller = Get.put(RegisterController());
//   final pdfController = Get.put(AddPdf());
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: controller.personalFormkey,
//         child: SizedBox(
//           height: 450.h,
//           child: ListView(children: [
//             FormText.registerText(
//                 "Enter your basic information to create your account"),
//             AppSizes.smallHeightSizedBox,
//             FormText.textFieldLabel("Business License"),
//             GestureDetector(
//               onTap: () {
//                 pdfController.uploadFile();
//               },
//               child: Container(
//                 height: 120.h,
//                 width: 200.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.r),
//                   color: AppColor.secondaryScaffoldBacground,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Obx(() {
//                       if (pdfController.selectedFile.value == null) {
//                         return Center(
//                           child: Column(
//                             children: [
//                               AppSizes.mediumHeightSizedBox,
//                               Icon(
//                                 Icons.add,
//                                 color: AppColor.mainTextColor,
//                                 size: 50,
//                               ),
//                             ],
//                           ),
//                         ); // Empty container when no file is selected
//                       } else {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical: 5.h),
//                               width: 90.w,
//                               height: 65.h,
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: NetworkImage(
//                                           'https://cdn-icons-png.flaticon.com/512/3997/3997608.png'))),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                     onPressed: () =>
//                                         {pdfController.uploadFile()},
//                                     icon: const Icon(Icons.edit)),
//                                 IconButton(
//                                     onPressed: () => {
//                                           pdfController.deletePDFByVendorName(
//                                               pdfController.vendorName.value)
//                                         },
//                                     icon: const Icon(
//                                       Icons.delete,
//                                       color: Colors.red,
//                                     ))
//                               ],
//                             )
//                           ],
//                         );
//                       }
//                     }),
//                   ],
//                 ),
//               ),
//             )
//             // FormWidget(
//             //   login: Login(
//             //     onTap: () {
//             //       controller.openFilePicker();
//             //     },
//             //     controller: controller.filePathController,
//             //     enableText: true,
//             //     hintText: "select file",
//             //     icon: const Icon(Icons.file_copy),
//             //     invisible: false,
//             //     validator: null,
//             //     type: TextInputType.url,
//             //     inputFormat: null,
//             //   ),
//             //   color: ColorConstants.secondaryScaffoldBacground,
//             // ),
//             ,
//             // FormText.textFieldLabel("Add Your Business Image"),

//             // ImageWidegt.imageContainer(
//             //     controller.selectImage != null
//             //         ? Image.file(
//             //             controller.selectImage!,
//             //             fit: BoxFit.cover,
//             //           )
//             //         : FormText.textFieldLabel("Choose an image"), () {
//             //   pickImage();
//             // }),
//             AppSizes.smallHeightSizedBox,
//             FormText.textFieldLabel("Category"),
//             const CategoerySelect(),
//             AppSizes.smallHeightSizedBox,
//             FormText.textFieldLabel("Description"),
//             FormWidget(
//               login: FormModel(
//                 onTap: () {},
//                 controller: controller.description,
//                 enableText: false,
//                 hintText: "Description",
//                 icon: const Icon(Icons.email),
//                 invisible: false,
//                 validator: null,
//                 // (email) => controller.validateDescription(),
//                 type: TextInputType.emailAddress,
//                 inputFormat: null,
//               ),
//             ),
//           ]),
//         ));
//   }

//   Future pickImage() async {
//     XFile? file = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxHeight: 150.h,
//       maxWidth: 500.w,
//       imageQuality: 75,
//     );
//     final imagPath = File(file!.path);

//     setState(() {
//       controller.selectImage = imagPath;
//     });
//   }
// }
