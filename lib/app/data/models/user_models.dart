import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String username;
  String email;
  String bio;
  String profilePicture;
  String coverPhoto;
  int followers;
  int following;
  int posts;
  String dob;
  Timestamp? createdAt;

  UserModel({
    this.uid = '',
    this.name = '',
    this.username = '',
    this.email = '',
    this.bio = '',
    this.profilePicture = '',
    this.coverPhoto = '',
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
    this.dob = '',
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      coverPhoto: map['coverPhoto'] ?? '',
      followers: map['followers'] ?? 0,
      following: map['following'] ?? 0,
      posts: map['posts'] ?? 0,
      dob: map['dob'] ?? '',
      createdAt: map['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'email': email,
      'bio': bio,
      'profilePicture': profilePicture,
      'coverPhoto': coverPhoto,
      'followers': followers,
      'following': following,
      'posts': posts,
      'dob': dob,
      'createdAt': createdAt,
    };
  }
}
