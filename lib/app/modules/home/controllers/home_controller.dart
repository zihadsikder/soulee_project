// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
//
// class HomeController extends GetxController {
//   var isPublic = true.obs;
//   var memories = <Memory>[].obs;
//   var feedPosts = <FeedPost>[].obs;
//   var zones = <Zone>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Sample data for memories
//     memories.addAll([
//       Memory(
//         month: 'Jan',
//         name: 'Trip',
//         title: 'Beach Day',
//         imagePath: ImagePath.cover,
//         color: Colors.blue,
//       ),
//       Memory(
//         month: 'Feb',
//         name: 'Party',
//         title: 'Birthday',
//         imagePath: ImagePath.cover,
//         color: Colors.red,
//       ),
//     ]);
//
//     // Sample data for feed posts
//     feedPosts.addAll([
//       FeedPost(
//         userName: 'Musarrat Tabassum',
//         timeAgo: '2h ago',
//         content: 'Enjoying a sunny day at the beach!',
//         imageUrl: 'https://example.com/beach.jpg',
//         likes: 120,
//         comments: 15,
//       ),
//       FeedPost(
//         userName: 'John Doe',
//         timeAgo: '5h ago',
//         content: 'Loving this new cafe in town.',
//         imageUrl: null,
//         likes: 85,
//         comments: 10,
//       ),
//     ]);
//
//     // Sample data for zones
//     zones.addAll([
//       Zone(
//         name: 'Pet Lovers',
//         imagePath: ImagePath.cover,
//       ),
//       Zone(
//         name: 'Travel Buddies',
//         imagePath: ImagePath.cover,
//       ),
//       Zone(
//         name: 'Foodies',
//         imagePath: ImagePath.cover,
//       ),
//       Zone(
//         name: 'Fitness Freaks',
//         imagePath: ImagePath.cover,
//       ),
//     ]);
//   }
//
//   void togglePublicProfile() {
//     isPublic.value = !isPublic.value;
//   }
// }
//
// class Memory {
//   final String month;
//   final String name;
//   final String title;
//   final String imagePath;
//   final Color color;
//
//   Memory({
//     required this.month,
//     required this.name,
//     required this.title,
//     required this.imagePath,
//     required this.color,
//   });
// }
//
// class FeedPost {
//   final String userName;
//   final String timeAgo;
//   final String content;
//   final String? imageUrl;
//   final int likes;
//   final int comments;
//
//   FeedPost({
//     required this.userName,
//     required this.timeAgo,
//     required this.content,
//     this.imageUrl,
//     required this.likes,
//     required this.comments,
//   });
// }
//
// class Zone {
//   final String name;
//   final String imagePath;
//
//   Zone({
//     required this.name,
//     required this.imagePath,
//   });
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';

class Memory {
  final String id;
  final String month;
  final String name;
  final String title;
  final String imagePath;
  final String profileImage;


  Memory({
    required this.id,
    required this.month,
    required this.name,
    required this.title,
    required this.imagePath,
    required this.profileImage,

  });
}

class Zone {
  final String id;
  final String title;
  final String imagePath;
  final int memberCount;
  final bool isNew;

  Zone({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.memberCount,
    this.isNew = false,
  });
}

class HomeController extends GetxController {
  var isPublic = true.obs;
  var selectedTab = 0.obs;

  final RxList<Memory> memories = <Memory>[
    Memory(
      id: '1',
      month: 'JAN',
      name: 'Memories',
      title: 'New Year',
      imagePath: ImagePath.zone1,
      profileImage: ImagePath.pp,

    ),
    Memory(
      id: '2',
      month: 'FEB',
      name: 'Memories',
      title: 'Valentine',
      imagePath: ImagePath.memory2,
      profileImage: ImagePath.pp,

    ),
    Memory(
      id: '2',
      month: 'FEB',
      name: 'Memories',
      title: 'Valentine',
      imagePath: ImagePath.memory3,
        profileImage: ImagePath.pp,

    ),
  ].obs;

  final RxList<Zone> zones = <Zone>[
    Zone(
      id: '1',
      title: 'Motherhood Fur Parents Zone',
      imagePath: 'assets/images/zone1.jpg',
      memberCount: 120,
      isNew: true,
    ),
    Zone(
      id: '2',
      title: 'PCOS APARTMENT',
      imagePath: 'assets/images/zone2.jpg',
      memberCount: 85,
    ),
    Zone(
      id: '3',
      title: 'Relationship',
      imagePath: 'assets/images/zone3.jpg',
      memberCount: 210,
    ),
    Zone(
      id: '4',
      title: 'Mental Health',
      imagePath: 'assets/images/zone4.jpg',
      memberCount: 150,
      isNew: true,
    ),
  ].obs;

  final RxList<Map<String, dynamic>> feeds = <Map<String, dynamic>>[
    {
      'id': '1',
      'userName': 'Sarah Johnson',
      'userAvatar': 'assets/images/avatar1.jpg',
      'timeAgo': '2 hours ago',
      'content': 'A wonderful day with my furry friend! #catlover',
      'imagePath': 'assets/images/feed1.jpg',
      'likes': 24,
      'comments': 5,
    },
    {
      'id': '2',
      'userName': 'Michael Chen',
      'userAvatar': 'assets/images/avatar2.jpg',
      'timeAgo': '5 hours ago',
      'content': 'Sharing my journey with PCOS. Stay strong everyone!',
      'imagePath': 'assets/images/feed2.jpg',
      'likes': 56,
      'comments': 12,
    },
  ].obs;

  void togglePublicProfile() {
    isPublic.value = !isPublic.value;
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void addMemory() {
    // Implementation for adding a new memory
    Get.snackbar('Add Memory', 'Feature coming soon!');
  }

  void viewZone(String zoneId) {
    // Implementation for viewing a zone
    Get.snackbar('View Zone', 'Opening zone $zoneId');
  }

  void likeFeed(String feedId) {
    final index = feeds.indexWhere((feed) => feed['id'] == feedId);
    if (index != -1) {
      feeds[index]['likes'] = feeds[index]['likes'] + 1;
      feeds.refresh();
    }
  }

  void commentOnFeed(String feedId) {
    // Implementation for commenting on a feed
    Get.snackbar('Comment', 'Opening comment section for post $feedId');
  }

  void shareFeed(String feedId) {
    // Implementation for sharing a feed
    Get.snackbar('Share', 'Sharing post $feedId');
  }
}
