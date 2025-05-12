import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/modules/home/views/widgets/text_container.dart';

import '../../../../data/core/utils/constans/image_path.dart';
import '../../models/memory.dart';

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
          width: 120.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: Colors.red,
            image: DecorationImage(image: AssetImage(memory.imagePath),fit: BoxFit.fill)
          ),
          padding: EdgeInsets.all(10.h),
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
              TextContainerProfile(text: memory.title),
            ],
          ),
        ),
      ],
    );
  }
}

