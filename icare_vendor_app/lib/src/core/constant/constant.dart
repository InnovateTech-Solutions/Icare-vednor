import 'package:flutter/material.dart';

import '../../feature/register/widget/steper_widget/contact_details.dart';
import '../../feature/register/widget/steper_widget/personal_details.dart';
import '../../feature/register/widget/steper_widget/profile_details.dart';
import '../../feature/register/widget/steper_widget/working_details.dart';

class AppConst {
  AppConst._();
  static bool passwordVisible = false;
  //size const
  static double smallSize = 15;
  static double medium = 35;
  static double largeSize = 45;
  // String const
  static String shopName = "Shop Name";

  static String login = "LOGIN";
  static String signUp = "SIGN UP";
  static String email = "Email";
  static String password = "Password";
  static String username = "User Name";
  static String phoneNumber = "Phone Number";
  static String verificationOTP = "VERIFICATION CODE";
  static String services = "SERVICES";

  //stepper list
  static List<Step> stepList(int activeStep) => [
        Step(
          title: const Text(""),
          content: const ProfileDetailsWidget(),
          isActive: activeStep >= 0,
          state: activeStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          isActive: activeStep >= 1,
          title: const Text(""),
          content: const PersonalDetailWidget(),
          state: activeStep >= 2 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(""),
          content: const ContactDetailsWidget(),
          isActive: activeStep >= 2,
          state: activeStep >= 3 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(""),
          content: const WorkignDetailsWidget(),
          isActive: activeStep >= 3,
          state: activeStep >= 4 ? StepState.complete : StepState.disabled,
        ),
      ];

  //working day
  static List<String> days = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  //Profile List
}
