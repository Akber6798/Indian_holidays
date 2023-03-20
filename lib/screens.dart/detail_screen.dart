import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indian_holidays/services/colors.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.type,
      required this.date});

  var name;
  var description;
  var type;
  var date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            Image(
                height: 40.h,
                width: 40.w,
                image: const AssetImage('assets/india.png')),
            SizedBox(
              width: 20.w,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(name, style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20.h),
            Text(description,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppColors.textLightColor)),
            SizedBox(height: 10.h),
            Text(type.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppColors.textColor, fontSize: 15.sp)),
            SizedBox(height: 10.h),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  date.toString(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.secondaryColor, fontSize: 16.sp),
                )),
          ],
        ),
      ),
    );
  }
}
