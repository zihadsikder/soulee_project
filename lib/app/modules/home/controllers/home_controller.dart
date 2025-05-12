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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/models/feeds.dart';

import '../models/memory.dart';
import '../models/zones.dart';





class HomeController extends GetxController {
  var isPublic = true.obs;
  var selectedTab = 0.obs;
  final RxBool isSeeAll = false.obs;

  void toggleSeeAll() {
    isSeeAll.value = !isSeeAll.value;
    if (isSeeAll.value) {
    }
  }



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
      id: '3',
      month: 'FEB',
      name: 'Memories',
      title: 'Valentine',
      imagePath: ImagePath.memory3,
        profileImage: ImagePath.pp,

    ),
  ].obs;


  final RxList<Feeds> feeds = <Feeds>[
    Feeds(
      id: '1',
      month: 'September',
      name: 'Saiti Martin',
      title: 'A Journey to All Ways Remember',
      imagePath: ImagePath.feed1,
      profileImage: ImagePath.pp,

    ),
    Feeds(
      id: '2',
      month: 'September',
      name: 'Saiti Martin',
      title: 'পূজার দিন',
      imagePath: ImagePath.feed2,
      profileImage: ImagePath.pp,

    ),
    Feeds(
      id: '3',
      month: 'September',
      name: 'Saiti Martin',
      title: 'A Journey to All Ways Remember',
      imagePath: ImagePath.feed3,
      profileImage: ImagePath.pp,

    ),
    Feeds(
      id: '4',
      month: 'September',
      name: 'Saiti Martin',
      title: 'Letest Artwork',
      imagePath: ImagePath.feed4,
      profileImage: ImagePath.pp,

    ),
  ].obs;

  final RxList<Zones> zones = <Zones>[
    Zones(
      id: '1',
      title: 'Motherhood Fur Parents Zone',
      imagePath: ImagePath.zone1,

    ),
    Zones(
      id: '2',
      title: 'BRAC UNI CSE DEPARTMENT',
      imagePath:  ImagePath.zone2,
    ),
    Zones(
      id: '3',
      title: 'MotherLand Fur Parents Zone',
      imagePath:  ImagePath.memory2,
    ),
    Zones(
      id: '4',
      title: 'World UNI CSE DEPARTMENT',
      imagePath: ImagePath.memory3,

    ),
  ].obs;
  //
  // final RxList<Map<String, dynamic>> feeds = <Map<String, dynamic>>[
  //   {
  //     'id': '1',
  //     'userName': 'Sarah Johnson',
  //     'userAvatar': 'assets/images/avatar1.jpg',
  //     'timeAgo': '2 hours ago',
  //     'content': 'A wonderful day with my furry friend! #catlover',
  //     'imagePath': 'assets/images/feed1.jpg',
  //     'likes': 24,
  //     'comments': 5,
  //   },
  //   {
  //     'id': '2',
  //     'userName': 'Michael Chen',
  //     'userAvatar': 'assets/images/avatar2.jpg',
  //     'timeAgo': '5 hours ago',
  //     'content': 'Sharing my journey with PCOS. Stay strong everyone!',
  //     'imagePath': 'assets/images/feed2.jpg',
  //     'likes': 56,
  //     'comments': 12,
  //   },
  // ].obs;

  void togglePublicProfile() {
    isPublic.value = !isPublic.value;
  }

  void addMemory() {
    // Implementation for adding a new memory
    Get.snackbar('Add Memory', 'Feature coming soon!');
  }

  void viewZone(String zoneId) {
    // Implementation for viewing a zone
    Get.snackbar('View Zone', 'Opening zone $zoneId');
  }


}
