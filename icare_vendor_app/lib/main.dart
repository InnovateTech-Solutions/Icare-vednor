import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/firebase_options.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/feature/register/view/register_page.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  Get.put(LocalUserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Icare Business',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.secondaryScaffoldBacground),
            useMaterial3: true,
          ),
          home: const RegisterPage(),
        );
      },
    );
  }
}
