import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/icon_path.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
import '../widgets/profile_text.dart';
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        return SingleChildScrollView(
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
                            border: Border.all(
                              width: 2,
                              color: AppColors.primary,
                            ),
                          ),
                          child: controller.user.value.profilePicture != null
                              ? Image.network(
                            controller.user.value.profilePicture!,
                            fit: BoxFit.fill,
                            width: 99.w,
                            height: 103.h,
                          )
                              : Image.asset(
                            ImagePath.profile,
                            fit: BoxFit.fill,
                            width: 99.w,
                            height: 103.h,
                          ),
                          // child: Image.asset(
                          //   ImagePath.profile,
                          //   fit: BoxFit.fill,
                          //   width: 99.w,
                          //   height: 103.h,
                          // ),
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
                            child: GestureDetector(
                              onTap: controller.updateProfilePicture,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
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
                        GestureDetector(
                          onTap: () {
                            /// Show dialog to update name/bio
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Profile"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: controller.nameTXController,
                                        decoration: InputDecoration(
                                          hintText: 'Name',
                                        ),
                                      ),
                                      TextField(
                                        controller: controller.bioTXController,
                                        decoration: InputDecoration(
                                          hintText: 'Bio',
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        controller.updateProfile(
                                          name: controller.nameTXController.text.trim(),

                                          bio:
                                              controller.bioTXController.text.trim(),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
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
                                text:
                                    controller.user.value.name ??
                                    'Musarrat Tabassum',
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
                              ProfileIconText(
                                text: 'Post',
                                icon: IconPath.edit,
                              ),
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

                    /// Memories Section
                    SizedBox(height: 24.h),
                    CustomText(
                      text: 'Memories',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: Container(
                            height: 26.h,
                            width: 26.w,

                            margin: EdgeInsets.only(left: 12.w),

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
                      ],
                    ),

                    // Zones Section
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Zones', fontSize: 14.sp),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller
                                  .toggleSeeAll();
                            },
                            child: CustomText(
                              text: controller.isSeeAll.value ? "Less" : 'Moor',
                              fontSize: 10.sp,

                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 130,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount:
                            controller.isSeeAll.value
                                ? controller.zones.length
                                : (controller.zones.length ?? 0) > 1
                                ? 2
                                : controller.zones.length,
                        itemBuilder: (context, index) {
                          return ZoneCard(
                            zone: controller.zones[index],
                            index: index,
                         );
                        },
                      ),
                    ),

                    // Feed Section
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(text: 'Feed', fontSize: 14.sp),
                    ),
                    SizedBox(height: 12.h),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      children: List.generate(
                        controller.feeds.length,

                        (index) {
                          var feed = controller.feeds[index];

                          return StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: index % 2 == 0 ? 3 : 2,
                            // Alternate tile height
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FeedCard(feeds: feed),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
// import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
// import 'package:soulee_project/app/data/core/utils/constans/icon_path.dart';
// import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
// import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
// import 'package:soulee_project/app/data/core/utils/constans/app_color.dart';
// import '../widgets/profile_text.dart';
// import '../widgets/memory_card.dart';
// import '../widgets/zone_card.dart';
// import '../widgets/feed_card.dart';
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
//         elevation: 0,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 12.h),
//           child: Image.asset(ImagePath.logo, height: 28.h, width: 62.w),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Section
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
//                           image: DecorationImage(image: AssetImage(   ImagePath.profile,)
//                           , fit: BoxFit.fill,),
//                                                       border: Border.all(
//                               width: 2,
//                               color: AppColors.primary,
//                             ),
//                         ),
//
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
//                             onChanged:
//                                 (value) => controller.togglePublicProfile(),
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
//             // Profile Info Section
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
//                   SizedBox(height: 12.h),
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
//                             SizedBox(height: 4.h),
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
//                             SizedBox(height: 4.h),
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
//                             SizedBox(height: 4.h),
//                             ProfileIconText(
//                               text: 'Add a moment',
//                               icon: IconPath.add,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Memories Section
//                   SizedBox(height: 24.h),
//                   CustomText(
//                     text: 'Memories',
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   SizedBox(height: 12.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 300,
//                         height: 107.h,
//                         child: Obx(
//                               () => ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: controller.memories.length,
//                             itemBuilder: (context, index) {
//                               return MemoryCard(
//                                 memory: controller.memories[index],
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//
//                       GestureDetector(
//                         onTap: () => controller.addMemory(),
//                         child: Container(
//                           height: 26.h,
//                           width: 26.w,
//
//                           margin: EdgeInsets.only(left: 12.w),
//                           //padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
//                           decoration: BoxDecoration(
//                             color: AppColors.primary,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.add,
//                               size: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Zones Section
//                   SizedBox(height: 24.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomText(
//                         text: 'Zones',
//                         fontSize: 14.sp,
//                       ),
//                       Obx(
//                             () => InkWell(
//                           onTap: () {
//                             controller
//                                 .toggleSeeAll(); // Toggle see all functionality
//                           },
//                           child: CustomText(
//                             text: controller.isSeeAll.value
//                                 ? "Less"
//                                 : 'Moor',
//                             fontSize: 10.sp,
//
//                             color: AppColors.textSecondary,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12.h),
//                   SizedBox(
//                     height: 130,
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 1.4,
//                         crossAxisSpacing: 12,
//                         mainAxisSpacing: 12,
//                       ),
//                       itemCount: controller.isSeeAll.value? controller.zones.length: (controller.zones.length ?? 0) > 1 ? 2 :controller.zones.length,
//                       itemBuilder: (context, index) {
//                         return ZoneCard(
//                           zone: controller.zones[index],
//                           index: index,
//                           // onTap:
//                           //     () =>
//                           //         controller.viewZone(controller.zones[index].id),
//                         );
//                       },
//                     ),
//                   ),
//
//                   // Feed Section
//                   SizedBox(height: 12.h),
//                   Align(
//                     alignment: Alignment.center,
//                     child: CustomText(
//
//                       text: 'Feed',
//                       fontSize: 14.sp,
//
//                     ),
//                   ),
//                   SizedBox(height: 12.h),
//                   StaggeredGrid.count(
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 8.h,
//                     crossAxisSpacing: 8.w,
//                     children: List.generate(
//                       controller.feeds.length,  // The number of items in your feeds
//                           (index) {
//                         var feed = controller.feeds[index];
//
//                         return StaggeredGridTile.count(
//                           crossAxisCellCount: 2,
//                           mainAxisCellCount: index % 2 == 0 ? 3 : 2,  // Alternate tile height
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: FeedCard(
//                               feeds: feed,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//
//
//
//                   SizedBox(height: 12.h),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

