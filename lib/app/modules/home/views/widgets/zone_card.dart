import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';

import '../../models/zones.dart';

class ZoneCard extends StatelessWidget {
  final Zones zone;
  final int index;
  const ZoneCard({
    super.key,
    required this.zone,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the index is even or odd
    Color textColor = index % 2 == 0 ? AppColors.textSecondary: Colors.white ;

    return Container(
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12.h),
        image: DecorationImage(
          image: AssetImage(zone.imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: CustomText(
          textAlign: TextAlign.center,
          text: zone.title,
          color: textColor,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}

