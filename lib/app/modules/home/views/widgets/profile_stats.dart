import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileStats extends StatelessWidget {
  final int posts;
  final int followers;
  final int following;

  const ProfileStats({
    Key? key,
    required this.posts,
    required this.followers,
    required this.following,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Posts', posts, () {
            Get.snackbar('Posts', 'View all $posts posts');
          }),
          _buildStatItem('Followers', followers, () {
            Get.snackbar('Followers', 'View all $followers followers');
          }),
          _buildStatItem('Following', following, () {
            Get.snackbar('Following', 'View all $following following');
          }),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            _formatCount(count),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
