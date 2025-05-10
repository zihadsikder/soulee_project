import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/common/widgets/custom_text.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/icon_path.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';

import '../../../../data/core/utils/constans/app_color.dart';
import '../widgets/highlights_row.dart';
import '../widgets/profile_header_large.dart';
import '../widgets/profile_post_grid_new.dart';
import '../widgets/profile_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding:  EdgeInsets.only(left: 12.h),
          child: Image.asset(ImagePath.logo, height: 28.h, width: 62.w),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 179.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Image.asset(ImagePath.cover, fit: BoxFit.fill),
                  // CachedNetworkImage(
                  //   imageUrl: controller.user.value.coverPhoto ?? '', // Use cover photo URL or fallback
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) => CircularProgressIndicator(
                  //     color: Color(0xFFFF5A60),
                  //   ),
                  //   errorWidget: (context, url, error) => Icon(
                  //     Icons.broken_image,
                  //     size: 50,
                  //     color: Colors.grey,
                  //   ),
                  // ),
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
                          //shape: BoxShape.circle,
                          // border: Border.all(
                          //   color: AppColors.primary,
                          //   width: 2,
                          // ),
                        ),
                        child: Image.asset(ImagePath.profile,fit: BoxFit.fill,  width: 99.w,
                          height: 103.h,)
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Profile', fontSize: 14.sp),
                      Row(
                        children: [
                          CustomText(text: 'Edit', fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          )

                          ,
                          SizedBox(width: 4.w),
                          Image.asset(IconPath.edit, color: AppColors.textSecondary, height: 16.h, width: 16.w),


                        ],
                      )
                    ],
                  ),

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
                          spacing: 4.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileIconText(
                              text: 'Musarrat Tabassum',
                              icon: IconPath.user,
                            ),
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
                            ProfileIconText(
                              text: 'Add a moment',
                              icon: IconPath.add,
                            ),
                          ],
                        ),
                      ],
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

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ProfileInfoItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Obx(() {
//         if (_authController.isLoading.value) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Color(0xFFFF5A60),
//             ),
//           );
//         }
//
//         if (_authController.error.value.isNotEmpty) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Error: ${_authController.error.value}',
//                   style: const TextStyle(color: Colors.red),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () => _authController.getUserData(),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFFF5A60),
//                   ),
//                   child: const Text('Retry'),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         return RefreshIndicator(
//           onRefresh: () => _authController.getUserData(),
//           color: Color(0xFFFF5A60),
//           child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 floating: true,
//                 pinned: true,
//                 title: Text(
//                   'Profile',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 actions: [
//                   IconButton(
//                     icon: Icon(Icons.refresh, color: Colors.black),
//                     onPressed: () => _authController.getUserData(),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.menu, color: Colors.black),
//                     onPressed: () {
//                       // Menu action
//                     },
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: ProfileHeaderLarge(
//                   profilePicture: _authController.user.value.profilePicture,
//                   name: _authController.user.value.name,
//                   username: _authController.user.value.username,
//                   email: _authController.user.value.email,
//                   followers: _authController.user.value.followers,
//                   following: _authController.user.value.following,
//                   posts: _authController.user.value.posts,
//                   onEditProfile: () => _showEditProfileDialog(),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   child: Text(
//                     'Highlights',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: HighlightsRow(),
//               ),
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 16.0),
//                   child: ProfileTabs(tabController: _tabController),
//                 ),
//               ),
//               ProfilePostsGridNew(tabController: _tabController),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   void _showEditProfileDialog() {
//     final nameController = TextEditingController(text: _authController.user.value.name);
//     final bioController = TextEditingController(text: _authController.user.value.bio);
//
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Edit Profile'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: bioController,
//               decoration: const InputDecoration(labelText: 'Bio'),
//               maxLines: 3,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               _authController.updateProfile(
//                 name: nameController.text,
//                 bio: bioController.text,
//               );
//               Get.back();
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
// }
