import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';

import '../../../../data/core/common/widgets/custom_text.dart';
import '../../../../data/core/utils/constans/app_color.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.h),
        color: AppColors.textPrimary,
      ),
      child: SizedBox(
        //width: 50.w,
        child: CustomText(
          text: text,
          maxLines: 2,
          color: Colors.white,
          fontSize: 6.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
class TextContainerProfile extends StatelessWidget {
  const TextContainerProfile({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.h),
        color: AppColors.textPrimary,
      ),
      child: SizedBox(
        width: 50.w,
        child: CustomText(
          text: text,
          maxLines: 2,
          color: Colors.white,
          fontSize: 6.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}