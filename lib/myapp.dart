import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/function.dart';
import 'package:onlyproject/features/home/presentation/view/home_view.dart';
import 'package:onlyproject/features/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.background,
            iconTheme: IconThemeData(color: AppColor.primary),
          ),
          brightness: Brightness.light,
         
          scaffoldBackgroundColor: AppColor.background,
        ),
        home: isLogin ? const HomeView() : const Splash(),
      ),
    );
  }
}
