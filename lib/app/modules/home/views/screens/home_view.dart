import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/utils/constans/app_sizer.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';

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
      appBar: AppBar(
        leading: Image.asset(ImagePath.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [Container(
            height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
                child: CachedNetworkImage(
                  imageUrl: controller.user.value.coverPhoto ?? '', // Use cover photo URL or fallback
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: Color(0xFFFF5A60),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),

                Positioned(
                  bottom: -50,
                  left: 0,

                  child: Stack(
                children: [
                Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                  child: Obx(() {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          controller.user.value.profilePicture ?? ''),
                      backgroundColor: Colors.grey.shade300,
                    );
                  }),
                ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.red,
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
    ),),
                Positioned(
                  right: 10.w,
                  bottom: 10.h,

                  child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration:  BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),)
              ],

            ),






            Column(
              children: [
                // Profile Header with Cover Image
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Cover Image with Flowers
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(

                      ),
                      child: CachedNetworkImage(
                        imageUrl: controller.user.value.profilePicture,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        placeholder: (context, url) => CircularProgressIndicator(
                          color: Color(0xFFFF5A60),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    // Profile Picture
                    Positioned(
                      bottom: -50,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://i.imgur.com/JQZm8Qd.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
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

                    // Edit Button
                    Positioned(
                      top: 40,
                      right: 10,
                      child: IconButton(
                        onPressed: controller.editProfile,
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacing for Profile Picture
                const SizedBox(height: 60),

                // Profile Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Username
                      Obx(() => Text(
                        controller.username.value,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )),

                      const SizedBox(height: 15),

                      // Public Profile Toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Public profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Obx(() => Switch(
                            value: controller.isPublic.value,
                            onChanged: (value) => controller.togglePublicProfile(),
                            activeColor: Colors.red,
                          )),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Profile Details
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Bio
                            ProfileInfoItem(
                              icon: Icons.pets,
                              text: controller.bio.value,
                              color: Colors.red.shade300,
                            ),

                            const Divider(height: 20),

                            // Date
                            ProfileInfoItem(
                              icon: Icons.calendar_today,
                              text: controller.date.value,
                              color: Colors.red.shade300,
                            ),

                            const Divider(height: 20),

                            // Gender
                            ProfileInfoItem(
                              icon: Icons.person,
                              text: controller.gender.value,
                              color: Colors.red.shade300,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Action Buttons
                      Row(
                        children: [
                          // Add Moment Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: controller.addMoment,
                              icon: const Icon(Icons.add_circle_outline),
                              label: const Text('Add a moment'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade50,
                                foregroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          // Post Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: controller.createPost,
                              icon: const Icon(Icons.post_add),
                              label: const Text('Post'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
