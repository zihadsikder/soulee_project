import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulee_project/app/data/core/utils/constans/image_path.dart';
import 'package:soulee_project/app/modules/home/views/screens/home_view.dart';
import '../../../data/models/user_models.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final RxString username = 'Musarrat Tabassum'.obs;
  final RxString bio = 'Pet Parent'.obs;
  final RxString date = 'Jan 13'.obs;
  final RxString gender = 'Female'.obs;
  final RxBool isPublic = true.obs;

  void togglePublicProfile() {
    isPublic.value = !isPublic.value;
  }

  void editProfile() {
    Get.snackbar(
      'Edit Profile',
      'Edit profile functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addMoment() {
    Get.snackbar(
      'Add Moment',
      'Add moment functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void createPost() {
    Get.snackbar(
      'Create Post',
      'Create post functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<UserModel> user = UserModel().obs;

  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _handleAuthChanged);
  }

  _handleAuthChanged(User? user) async {
    if (user != null) {
      print("User authenticated: ${user.email}");
      await getUserData();
    }
  }

  // Auto-login with the existing Firebase user
  Future<void> autoLogin() async {
    isLoading.value = true;
    error.value = '';

    try {
      // Check if already logged in
      if (_auth.currentUser != null) {
        print("Already logged in as: ${_auth.currentUser!.email}");
        await getUserData();
        isLoading.value = false;
        return;
      }

      print("Auto-login with soulee@gmail.com");
      await _auth.signInWithEmailAndPassword(
        email: 'soulee@gmail.com',
        password: '123456',
      );
      print("Auto-login successful");

      // Check if user exists in Firestore
      await _checkUserExists(_auth.currentUser!.uid);
    } catch (e) {
      print("Auto-login failed: $e");
      error.value = 'Failed to auto-login: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _checkUserExists(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        print("User exists in Firestore, loading data");
        user.value = UserModel.fromMap(doc.data()!);
      } else {
        print("User doesn't exist in Firestore, creating new user data");
        await _createNewUserData(uid);
      }
    } catch (e) {
      print("Error checking user: $e");
      error.value = 'Failed to check user: ${e.toString()}';
    }
  }

  Future<void> _createNewUserData(String uid) async {
    try {
      // Get basic info from Firebase Auth
      final currentUser = _auth.currentUser;
      final displayName = currentUser?.displayName ?? 'Soulee';
      final email = currentUser?.email ?? 'soulee@gmail.com';
      final photoURL = currentUser?.photoURL ?? '';

      print("Creating new user with email: $email");

      // Create new user data
      final userData = {
        'uid': uid,
        'name': displayName,
        'username': email.split('@')[0],
        'email': email,
        'bio': 'Hey there! I\'m using this app.',
        'profilePicture': 'assets/images/profile.png',
        'coverPhoto': 'assets/images/cover.png',
        'followers': 54,
        'following': 32,
        'posts': 9,
        'dob': 'Jan 12',
        'createdAt': Timestamp.now(),
      };

      await _firestore.collection('users').doc(uid).set(userData);
      await getUserData();
    } catch (e) {
      print("Error creating user data: $e");
      error.value = 'Failed to create user data: ${e.toString()}';
    }
  }

  Future<void> getUserData() async {
    isLoading.value = true;
    error.value = '';

    try {
      if (_auth.currentUser != null) {
        final uid = _auth.currentUser!.uid;
        print("Getting user data for UID: $uid");
        final doc = await _firestore.collection('users').doc(uid).get();

        if (doc.exists) {
          print("User data found in Firestore");
          user.value = UserModel.fromMap(doc.data()!);
          print("User data loaded: ${user.value.name}, ${user.value.email}");
        } else {
          print("No user data found in Firestore");
          await _createNewUserData(uid);
        }
      }
    } catch (e) {
      print("Error loading user data: $e");
      error.value = 'Failed to load user data: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile({String? name, String? bio}) async {
    isLoading.value = true;
    error.value = '';

    try {
      if (_auth.currentUser != null) {
        final uid = _auth.currentUser!.uid;
        final updates = <String, dynamic>{};

        if (name != null && name.isNotEmpty) {
          updates['name'] = name;
          // Also update display name in Firebase Auth
          await _auth.currentUser!.updateDisplayName(name);
          print("Updated name to: $name");
        }

        if (bio != null) {
          updates['bio'] = bio;
          print("Updated bio to: $bio");
        }

        if (updates.isNotEmpty) {
          await _firestore.collection('users').doc(uid).update(updates);
          await getUserData();
          print("Profile updated successfully");

          // Show success message
          Get.snackbar(
            'Success',
            'Profile updated successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade100,
            colorText: Colors.green.shade800,
          );
        }
      }
    } catch (e) {
      print("Failed to update profile: $e");
      error.value = 'Failed to update profile: ${e.toString()}';

      // Show error message
      Get.snackbar(
        'Error',
        'Failed to update profile: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfilePicture() async {
    isLoading.value = true;
    error.value = '';

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null && _auth.currentUser != null) {
        final uid = _auth.currentUser!.uid;
        final file = File(pickedFile.path);

        print("Uploading profile picture");

        // Upload to Firebase Storage
        final ref = _storage.ref().child('profile_pictures/$uid.jpg');
        await ref.putFile(file);

        // Get download URL
        final url = await ref.getDownloadURL();
        print("Profile picture uploaded, URL: $url");

        // Update Firestore
        await _firestore.collection('users').doc(uid).update({
          'profilePicture': url,
        });

        // Also update photoURL in Firebase Auth
        await _auth.currentUser!.updatePhotoURL(url);

        await getUserData();
        print("Profile picture updated successfully");

        // Show success message
        Get.snackbar(
          'Success',
          'Profile picture updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade100,
          colorText: Colors.green.shade800,
        );
      }
    } catch (e) {
      print("Failed to update profile picture: $e");
      error.value = 'Failed to update profile picture: ${e.toString()}';

      // Show error message
      Get.snackbar(
        'Error',
        'Failed to update profile picture: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
