import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_holidays/screens.dart/splash_screen.dart';
import 'package:indian_holidays/services/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: ((context, child) {
        return MaterialApp(
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColors.scaffoldColor,
              appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.scaffoldColor,
                  elevation: 0,
                  iconTheme: IconThemeData(
                      color: AppColors.secondaryColor, size: 25.sp),
                  titleTextStyle: GoogleFonts.mulish(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 26.sp)),
              textTheme: TextTheme(
                headline6: GoogleFonts.aBeeZee(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
                    headline4: GoogleFonts.aBeeZee(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor),
              )),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
