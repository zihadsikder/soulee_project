import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/modules/home/models/feeds.dart';
import 'package:soulee_project/app/modules/home/views/widgets/text_container.dart';

import '../../../../data/core/utils/constans/image_path.dart';
import 'memory_card.dart';

class FeedCard extends StatelessWidget {
  final Feeds feeds;

  const FeedCard({
    super.key,
    required this.feeds,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            image: DecorationImage(
              image: AssetImage(feeds.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Text over the image - Month and Name
        Positioned(
          top: 13.h,
          left: 13.w,
          child: TextContainer(text: feeds.month),
        ),
        Positioned(
          top: 13.h,
          right: 13.w,
          child: TextContainer(text: feeds.name),
        ),
        // Title text at the bottom
        Positioned(
          bottom: 13.h,
          left: 13.w,
          right: 13.w,
          child: Row(
            children: [
              // Profile Image Icon
              Container(
                width: 15.w,
                height: 17.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImagePath.pp),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ImagePath.pp,
                    fit: BoxFit.fill,
                    width: 15.w,
                    height: 17.h,
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              // Title text
              TextContainerProfile(text: feeds.title),
            ],
          ),
        ),
      ],
    );
  }
}

