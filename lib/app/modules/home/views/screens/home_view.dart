// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
// import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
// import 'package:soulee_project/app/data/core/utils/constans/icon_path.dart';
// import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
// import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
// import '../../../../data/core/utils/constans/app_color.dart';
// import '../widgets/profile_icon_text.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.put(HomeController());
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 12.h),
//           child: Image.asset(ImagePath.logo, height: 28.h, width: 62.w),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Cover Photo and Profile Section
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 179.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(color: Colors.red),
//                   child: Image.asset(ImagePath.cover, fit: BoxFit.fill),
//                 ),
//                 Positioned(
//                   bottom: -50,
//                   left: 20,
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: 99.w,
//                         height: 103.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(180),
//                             topRight: Radius.circular(160),
//                             bottomLeft: Radius.circular(220),
//                             bottomRight: Radius.circular(210),
//                           ),
//                         ),
//                         child: Image.asset(
//                           ImagePath.profile,
//                           fit: BoxFit.fill,
//                           width: 99.w,
//                           height: 103.h,
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 2,
//                         right: 0,
//                         child: Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.30),
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 10.w,
//                   bottom: 10.h,
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.10),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   right: 10.w,
//                   bottom: -40.h,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomText(
//                         text: 'Public Profile',
//                         fontSize: 10.sp,
//                         color: AppColors.textSecondary,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       const SizedBox(width: 8),
//                       Obx(
//                             () => Transform.scale(
//                           scale: 0.7,
//                           child: Switch(
//                             value: controller.isPublic.value,
//                             onChanged: (value) => controller.togglePublicProfile(),
//                             activeColor: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 48.h),
//
//             // Profile and Memory Section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomText(text: 'Profile', fontSize: 14.sp),
//                       Row(
//                         children: [
//                           CustomText(
//                             text: 'Edit',
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.textSecondary,
//                           ),
//                           SizedBox(width: 4.w),
//                           Image.asset(
//                             IconPath.edit,
//                             color: AppColors.textSecondary,
//                             height: 16.h,
//                             width: 16.w,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10.w,
//                       vertical: 10.h,
//                     ),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 1.w,
//                         color: AppColors.primary.withOpacity(0.20),
//                       ),
//                       borderRadius: BorderRadius.circular(8.h),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ProfileIconText(
//                               text: 'Musarrat Tabassum',
//                               icon: IconPath.user,
//                             ),
//                             Row(
//                               children: [
//                                 ProfileIconText(
//                                   text: '24',
//                                   icon: IconPath.tree,
//                                 ),
//                                 SizedBox(width: 36.w),
//                                 ProfileIconText(
//                                   text: 'Fur Parent',
//                                   icon: IconPath.fut,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 ProfileIconText(
//                                   text: 'Jan 12',
//                                   icon: IconPath.birth,
//                                 ),
//                                 SizedBox(width: 8.w),
//                                 ProfileIconText(
//                                   text: 'Female',
//                                   icon: IconPath.gender,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             ProfileIconText(text: 'Post', icon: IconPath.edit),
//                             ProfileIconText(
//                               text: 'Add a moment',
//                               icon: IconPath.add,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   CustomText(text: 'Memories', fontSize: 14.sp),
//                   SizedBox(height: 8.h),
//                   SizedBox(
//                     height: 400.h, // Fixed height for GridView
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         childAspectRatio: 0.7,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: controller.memories.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index == controller.memories.length) {
//                           return GestureDetector(
//                             onTap: () {
//                               print('Upload memory clicked');
//                             },
//                             child: Container(
//                               color: Colors.grey[300],
//                               child: Icon(Icons.add, size: 50, color: Colors.black),
//                             ),
//                           );
//                         } else {
//                           var memory = controller.memories[index];
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: memory.color,
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: AssetImage(memory.imagePath),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   top: 10,
//                                   left: 10,
//                                   child: Text(
//                                     memory.month,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 30,
//                                   left: 10,
//                                   child: Text(
//                                     memory.name,
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 10,
//                                   left: 10,
//                                   child: Text(
//                                     memory.title,
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Feed Section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(text: 'Feed', fontSize: 14.sp),
//                   SizedBox(height: 8.h),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: controller.feedPosts.length, // Assume feedPosts in controller
//                     itemBuilder: (context, index) {
//                       var post = controller.feedPosts[index];
//                       return Container(
//                         margin: EdgeInsets.only(bottom: 16.h),
//                         padding: EdgeInsets.all(12.h),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: AppColors.primary.withOpacity(0.20),
//                           ),
//                           borderRadius: BorderRadius.circular(8.h),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 20.h,
//                                   backgroundImage: AssetImage(ImagePath.profile),
//                                 ),
//                                 SizedBox(width: 8.w),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomText(
//                                       text: post.userName,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     CustomText(
//                                       text: post.timeAgo,
//                                       fontSize: 10.sp,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8.h),
//                             CustomText(
//                               text: post.content,
//                               fontSize: 12.sp,
//                             ),
//                             if (post.imageUrl != null) ...[
//                               SizedBox(height: 8.h),
//                               CachedNetworkImage(
//                                 imageUrl: post.imageUrl!,
//                                 fit: BoxFit.cover,
//                                 height: 200.h,
//                                 width: double.infinity,
//                                 placeholder: (context, url) => CircularProgressIndicator(
//                                   color: Color(0xFFFF5A60),
//                                 ),
//                                 errorWidget: (context, url, error) => Icon(
//                                   Icons.broken_image,
//                                   size: 50,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                             SizedBox(height: 8.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Image.asset(
//                                       IconPath.birth,
//                                       height: 16.h,
//                                       width: 16.w,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                     SizedBox(width: 4.w),
//                                     CustomText(
//                                       text: '${post.likes} Likes',
//                                       fontSize: 10.sp,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Image.asset(
//                                       IconPath.add,
//                                       height: 16.h,
//                                       width: 16.w,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                     SizedBox(width: 4.w),
//                                     CustomText(
//                                       text: '${post.comments} Comments',
//                                       fontSize: 10.sp,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//
//             // Zone Section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(text: 'Zones', fontSize: 14.sp),
//                   SizedBox(height: 8.h),
//                   SizedBox(
//                     height: 200.h, // Fixed height for Zone GridView
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 1.5,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: controller.zones.length, // Assume zones in controller
//                       itemBuilder: (context, index) {
//                         var zone = controller.zones[index];
//                         return Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.h),
//                             image: DecorationImage(
//                               image: AssetImage(zone.imagePath),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 bottom: 10,
//                                 left: 10,
//                                 child: CustomText(
//                                   text: zone.name,
//                                   fontSize: 12.sp,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/icon_path.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import '../widgets/profile_icon_text.dart';
import '../widgets/memory_card.dart';
import '../widgets/zone_card.dart';
import '../widgets/feed_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Image.asset(ImagePath.logo, height: 28.h, width: 62.w),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 179.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Image.asset(ImagePath.cover, fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: -50,
                  left: 20,
                  child: Stack(
                    children: [
                      Container(
                        width: 99.w,
                        height: 103.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(180),
                            topRight: Radius.circular(160),
                            bottomLeft: Radius.circular(220),
                            bottomRight: Radius.circular(210),
                          ),
                        ),
                        child: Image.asset(
                          ImagePath.profile,
                          fit: BoxFit.fill,
                          width: 99.w,
                          height: 103.h,
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.30),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10.w,
                  bottom: 10.h,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  right: 10.w,
                  bottom: -40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Public Profile',
                        fontSize: 10.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(width: 8),
                      Obx(
                        () => Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: controller.isPublic.value,
                            onChanged:
                                (value) => controller.togglePublicProfile(),
                            activeColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),

            // Profile Info Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Profile', fontSize: 14.sp),
                      Row(
                        children: [
                          CustomText(
                            text: 'Edit',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 4.w),
                          Image.asset(
                            IconPath.edit,
                            color: AppColors.textSecondary,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.w,
                        color: AppColors.primary.withOpacity(0.20),
                      ),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileIconText(
                              text: 'Musarrat Tabassum',
                              icon: IconPath.user,
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                ProfileIconText(
                                  text: '24',
                                  icon: IconPath.tree,
                                ),
                                SizedBox(width: 36.w),
                                ProfileIconText(
                                  text: 'Fur Parent',
                                  icon: IconPath.fut,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                ProfileIconText(
                                  text: 'Jan 12',
                                  icon: IconPath.birth,
                                ),
                                SizedBox(width: 8.w),
                                ProfileIconText(
                                  text: 'Female',
                                  icon: IconPath.gender,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ProfileIconText(text: 'Post', icon: IconPath.edit),
                            SizedBox(height: 4.h),
                            ProfileIconText(
                              text: 'Add a moment',
                              icon: IconPath.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Memories Section
                  SizedBox(height: 24.h),
                  CustomText(
                    text: 'Memories',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 107.h,
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.memories.length,
                            itemBuilder: (context, index) {
                              return MemoryCard(
                                memory: controller.memories[index],
                              );
                            },
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => controller.addMemory(),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 26.h,
                            width: 26.w,

                            margin: EdgeInsets.only(left: 12.w),
                            //padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Zones Section
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Zones',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'View all',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: controller.zones.length,
                    itemBuilder: (context, index) {
                      return ZoneCard(
                        zone: controller.zones[index],
                        onTap:
                            () =>
                                controller.viewZone(controller.zones[index].id),
                      );
                    },
                  ),

                  // Feed Section
                  SizedBox(height: 24.h),
                  CustomText(
                    text: 'Feed',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 12.h),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.feeds.length,
                      itemBuilder: (context, index) {
                        return FeedCard(
                          feed: controller.feeds[index],
                          onLike:
                              () => controller.likeFeed(
                                controller.feeds[index]['id'],
                              ),
                          onComment:
                              () => controller.commentOnFeed(
                                controller.feeds[index]['id'],
                              ),
                          onShare:
                              () => controller.shareFeed(
                                controller.feeds[index]['id'],
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
