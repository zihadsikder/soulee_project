
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/models/feeds.dart';

import '../../../data/models/user_models.dart';
import '../models/memory.dart';
import '../models/zones.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';



class HomeController extends GetxController {
  final TextEditingController nameTXController = TextEditingController();
  final TextEditingController bioTXController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<UserModel> user = UserModel().obs;
  var isPublic = true.obs;
  var selectedTab = 0.obs;
  final RxBool isSeeAll = false.obs;

  void togglePublicProfile() {
    isPublic.value = !isPublic.value;
  }

  void toggleSeeAll() {
    isSeeAll.value = !isSeeAll.value;
    if (isSeeAll.value) {
    }
  }
  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _handleAuthChanged);
  }

  _handleAuthChanged(User? user) async {
    if (user != null) {
      log("User authenticated: ${user.email}");
      await getUserData();
    }
  }

  /// Auto-login with the existing Firebase user
  Future<void> autoLogin() async {
    isLoading.value = true;
    error.value = '';

    try {
      /// Check if already logged in
      if (_auth.currentUser != null) {
        if (kDebugMode) {
          print("Already logged in as: ${_auth.currentUser!.email}");
        }
        await getUserData();
        isLoading.value = false;
        return;
      }

      if (kDebugMode) {
        print("Auto-login with soulee@gmail.com");
      }
      await _auth.signInWithEmailAndPassword(
        email: 'soulee@gmail.com',
        password: '123456',
      );
      if (kDebugMode) {
        print("Auto-login successful");
      }

      /// Check if user exists in Firestore
      //await _checkUserExists(_auth.currentUser!.uid);
    } catch (e) {
      if (kDebugMode) {
        print("Auto-login failed: $e");
      }
      error.value = 'Failed to auto-login: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> _checkUserExists(String uid) async {
  //   try {
  //     final doc = await _firestore.collection('users').doc(uid).get();
  //
  //     if (doc.exists) {
  //       print("User exists in Firestore, loading data");
  //       user.value = UserModel.fromMap(doc.data()!);
  //     } else {
  //       print("User doesn't exist in Firestore, creating new user data");
  //       await _createNewUserData(uid);
  //     }
  //   } catch (e) {
  //     print("Error checking user: $e");
  //     error.value = 'Failed to check user: ${e.toString()}';
  //   }
  // }


  /// Fetching user data from Firebase Firestore
  Future<void> getUserData() async {
    isLoading.value = true;
    error.value = '';
    try {
      final uid = _auth.currentUser!.uid;
      final doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        user.value = UserModel.fromMap(doc.data()!);
      } else {
        error.value = 'User data not found';
      }
    } catch (e) {
      if (e.toString().contains("cloud_firestore/unavailable")) {
        error.value = 'Firestore is temporarily unavailable. Please try again later.';
      } else {
        error.value = 'Failed to load user data: ${e.toString()}';
      }
    } finally {
      isLoading.value = false;
    }
  }



  /// Update Profile (Name, Bio, Picture)
  Future<void> updateProfile({String? name, String? bio}) async {
    isLoading.value = true;
    error.value = '';
    try {
      if (_auth.currentUser != null) {
        final uid = _auth.currentUser!.uid;
        final updates = <String, dynamic>{};
        if (name != null && name.isNotEmpty) {
          updates['name'] = name;
          await _auth.currentUser!.updateDisplayName(name);
        }
        if (bio != null) {
          updates['bio'] = bio;
        }
        if (updates.isNotEmpty) {
          await _firestore.collection('users').doc(uid).update(updates);
          await getUserData();
        }
      }
    } catch (e) {
      error.value = 'Failed to update profile: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
/// Update profile picture (with ImagePicker and Firebase Storage)
  Future<void> updateProfilePicture() async {
    isLoading.value = true;
    error.value = '';
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null && _auth.currentUser != null) {
        final uid = _auth.currentUser!.uid;
        final file = File(pickedFile.path);
        final ref = _storage.ref().child('profile_pictures/$uid.jpg');
        await ref.putFile(file);
        final url = await ref.getDownloadURL();

        await _firestore.collection('users').doc(uid).update({
          'profilePicture': url,
        });

        await _auth.currentUser!.updatePhotoURL(url);
        await getUserData();
      }
    } catch (e) {
      error.value = 'Failed to update profile picture: ${e.toString()}';
    } finally {
      isLoading.value = false;
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



  void addMemory() {
    Get.snackbar('Add Memory', 'Feature coming soon!');
  }




}
