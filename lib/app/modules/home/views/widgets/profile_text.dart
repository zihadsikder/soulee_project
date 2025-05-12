import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';

import '../../../../data/core/common/widgets/custom_text.dart';
import '../../../../data/core/utils/constans/app_color.dart';

class ProfileIconText extends StatelessWidget {
  const ProfileIconText({super.key, required this.text, required this.icon});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, color: AppColors.primary, height: 16.h, width: 16.w),
        SizedBox(width: 4.w),
        CustomText(text: text, fontSize: 14.sp),
      ],
    );
  }
}
