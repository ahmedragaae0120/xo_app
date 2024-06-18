import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_widgets/neon_widgets.dart';

class NeonContainerCustom extends StatelessWidget {
  final bool winner;
  final int score;
  final String playerName;
  final Color bordercolor;
  final Color containercolor;
  final Color spreadcolor;
  const NeonContainerCustom(
      {super.key,
      required this.winner,
      required this.score,
      required this.playerName,
      required this.bordercolor,
      required this.containercolor,
      required this.spreadcolor});

  @override
  Widget build(BuildContext context) {
    return winner
        ? NeonContainer(
            width: 150.w,
            height: 100.h,
            borderRadius: BorderRadius.circular(10.r),
            borderColor: bordercolor,
            containerColor: containercolor,
            spreadColor: spreadcolor,
            lightSpreadRadius: 2.r,
            lightBlurRadius: 15.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$playerName ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                    Text(
                      "$score",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                  ],
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: bordercolor.withOpacity(0.20),
            ),
            width: 150.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$playerName ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "$score",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
