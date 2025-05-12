import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';

class ZoneCard extends StatelessWidget {
  final Zone zone;
  final VoidCallback onTap;

  const ZoneCard({
    super.key,
    required this.zone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h),
          image: DecorationImage(
            image: AssetImage(zone.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.h),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: EdgeInsets.all(12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (zone.isNew)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: CustomText(
                    text: 'NEW',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: zone.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 14,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: '${zone.memberCount} members',
                        fontSize: 10.sp,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
