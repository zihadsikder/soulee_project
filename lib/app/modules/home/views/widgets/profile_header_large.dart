import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';


class ProfileHeaderLarge extends StatelessWidget {
  final String profilePicture;
  final String name;
  final String username;
  final String email;
  final int followers;
  final int following;
  final int posts;
  final VoidCallback onEditProfile;

  const ProfileHeaderLarge({
    super.key,
    required this.profilePicture,
    required this.name,
    required this.username,
    this.email = '',
    required this.followers,
    required this.following,
    required this.posts,
    required this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Large cover image with profile picture
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            // Cover image with flowers
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      'https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Profile picture
            Positioned(
              bottom: -50,
              child: GestureDetector(
                onTap: () {
                  Get.find<HomeController>().updateProfilePicture();
                },
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: profilePicture,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                            placeholder: (context, url) => CircularProgressIndicator(
                              color: Color(0xFFFF5A60),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF5A60),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 60),

        // Username and stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                username,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (name.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              if (email.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              SizedBox(height: 16),

              // Stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStat('$posts', 'Posts'),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      width: 40,
                    ),
                  ),
                  _buildStat('$followers', 'Followers'),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      width: 40,
                    ),
                  ),
                  _buildStat('$following', 'Following'),
                ],
              ),

              SizedBox(height: 16),

              // Edit profile button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onEditProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Edit profile'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStat(String count, String label) {
    return InkWell(
      onTap: () {
        Get.snackbar(
          label,
          'View $label',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
