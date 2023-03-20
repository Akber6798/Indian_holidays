import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indian_holidays/screens.dart/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomeScreen())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF7901),
            Color(0xFFeffae8),
            Color(0XFF44de39),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                height: 250.h,
                width: 250.w,
                image: const AssetImage('assets/kite.png')),
                SizedBox(height: 30.h),
            Text('Indian Holidays',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 35.sp))
          ],
        ),
      ),
    );
  }
}
