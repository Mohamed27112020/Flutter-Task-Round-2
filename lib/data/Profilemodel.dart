import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final String gender;
  final String imageUrl;

  UserProfile({
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.imageUrl,
  });

  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserProfile(
      fullName: data['fullName'] ?? 'NO NAME',
      email: data['email'] ?? 'NO EMAIL',
      mobileNumber: data['mobileNumber'] ?? 'NO MOBILE',
      dateOfBirth: data['dateOfBirth'] ?? 'NO DATE OF BIRTH',
      gender: data['gender'] ?? 'NO GENDER',
      imageUrl: data['imageUrl'] ?? 'NO IMAGE URL',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'imageUrl': imageUrl,
    };
  }
}
