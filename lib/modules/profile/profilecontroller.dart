import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/data/Profilemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<UserProfile?> userProfile = Rx<UserProfile?>(null);
  final RxBool isLoading = false.obs;
  Future<void> fetchUserProfile() async {
    try {
      isLoading(true);
      DocumentSnapshot doc =
          await _firestore
              .collection('Profiles')
              .doc("ys0Sr09sPPqXAPVWQ7Wz")
              .get();

      print('Document exists: ${doc.exists}');

      if (doc.exists) {
        final data = doc.data();
        print('Raw document data: $data'); // Debug raw data

        if (data != null) {
          final map = data as Map<String, dynamic>;
          print('Parsed document data: $map');

          userProfile.value = UserProfile.fromFirestore(doc);
          print('Parsed user profile: ${userProfile.value}');
        } else {
          print('Document data is null');
        }
      }
    } catch (e, stack) {
      print('Error fetching profile: $e\n$stack');
      //   userProfile.value = null;
      Get.snackbar('Error', 'Failed to fetch user data: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateUserProfile(UserProfile updatedProfile) async {
    try {
      isLoading(true);
      await _firestore
          .collection('Profiles')
          .doc('ys0Sr09sPPqXAPVWQ7Wz')
          .update(updatedProfile.toMap());
      userProfile.value = updatedProfile;
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e');
    } finally {
      isLoading(false);
    }
  }
}
