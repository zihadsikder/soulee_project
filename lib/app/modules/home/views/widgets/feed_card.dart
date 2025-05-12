import 'package:flutter/material.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';

class FeedCard extends StatelessWidget {
  final Map<String, dynamic> feed;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const FeedCard({
    Key? key,
    required this.feed,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and post time
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.h,
                  backgroundImage: AssetImage(feed['userAvatar']),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: feed['userName'],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: feed['timeAgo'],
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Post content
          if (feed['content'] != null && feed['content'].isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: CustomText(
                text: feed['content'],
                fontSize: 14.sp,
              ),
            ),

          // Post image
          if (feed['imagePath'] != null)
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              width: double.infinity,
              height: 200.h,
              child: Image.asset(
                feed['imagePath'],
                fit: BoxFit.cover,
              ),
            ),

          // Like, comment, share buttons
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildActionButton(
                      icon: Icons.favorite_border,
                      label: '${feed['likes']}',
                      onTap: onLike,
                    ),
                    SizedBox(width: 16.w),
                    _buildActionButton(
                      icon: Icons.chat_bubble_outline,
                      label: '${feed['comments']}',
                      onTap: onComment,
                    ),
                  ],
                ),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: onShare,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.textSecondary,
          ),
          SizedBox(width: 4.w),
          CustomText(
            text: label,
            fontSize: 12.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
