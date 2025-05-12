import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';

import '../../../../data/core/utils/constans/image_path.dart';

class MemoryCard extends StatelessWidget {
  final Memory memory;

  const MemoryCard({
    super.key,
    required this.memory,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 107.h,
          width: 150.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: Colors.red,
            image: DecorationImage(image: AssetImage(memory.imagePath),fit: BoxFit.fill)
          ),
          padding: EdgeInsets.all(10.h),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(8.h), // Ensures image doesn't overflow
          //   child: Image.asset(
          //
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ),
        Positioned(
          top: 13.h,
          left: 13.w,
          child: TextContainer(text: memory.month),
        ),
        Positioned(
          top: 13.h,
          right: 26.w,
          child: TextContainer(text: memory.name),
        ),
        Positioned(
          bottom: 13.h,
          left: 13.w,
          child: Row(
            children: [
              Container(
                width: 15.w,
                height: 17.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(180),
                    topRight: Radius.circular(160),
                    bottomLeft: Radius.circular(220),
                    bottomRight: Radius.circular(210),
                  ),
                  image: DecorationImage(
                    image: AssetImage(ImagePath.pp),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(width: 1, color: AppColors.primary),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(180),
                    topRight: Radius.circular(160),
                    bottomLeft: Radius.circular(220),
                    bottomRight: Radius.circular(210),
                  ),
                  child: Image.asset(
                    ImagePath.pp,
                    fit: BoxFit.fill,
                    width: 15.w,
                    height: 17.h,
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              TextContainer(text: memory.title),
            ],
          ),
        ),
      ],
    );
  }
}

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
      child: CustomText(
        text: text,
        color: Colors.white,
        fontSize: 6.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
