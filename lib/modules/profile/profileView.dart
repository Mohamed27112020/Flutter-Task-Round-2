import 'package:cached_network_image/cached_network_image.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Core/styling/app_styles.dart';
import 'package:fire_app/data/Profilemodel.dart';
import 'package:fire_app/modules/EditProfile/EditProfile.dart';
import 'package:fire_app/modules/profile/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UserController userController = Get.put(UserController());
  //UserProfile? userProfile;
  @override
  Widget build(BuildContext context) {
    userController.fetchUserProfile();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppStyles.primary24HeadStyle.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => ProfileDetailsScreen(),
                arguments: userController.userProfile.value,
              );
            },
            icon: Icon(Icons.edit_rounded, color: AppColors.primaryColor),
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (userController.userProfile.value == null) {
          return Center(child: Text('No No data available'));
        }

        final user = userController.userProfile.value!;
        print(user.fullName);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info Section
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(
                      user.imageUrl,
                      scale: 1.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    user.fullName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    user.email,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 24),

                // Profile Actions Section
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildListTile("Profile", Icons.person_outline),
                      Container(width: 16, color: AppColors.whiteColor),
                      _buildListTile('Wishlist', Icons.favorite_border),
                      Container(width: 16, color: AppColors.whiteColor),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/myorders");
                        },
                        child: _buildListTile(
                          'My Orders',
                          Icons.shopping_bag_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Settings Options Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildSimpleListTile(
                        'Privacy Policy',
                        Icons.key_outlined,
                      ),
                      const Divider(height: 24, thickness: 1),
                      _buildSimpleListTile(
                        'Payment Methods',
                        Icons.payment_outlined,
                      ),
                      const Divider(height: 24, thickness: 1),
                      _buildSimpleListTile(
                        'Notification',
                        Icons.notification_add_outlined,
                      ),
                      const Divider(height: 24, thickness: 1),
                      _buildSimpleListTile(
                        'Settings',
                        Icons.settings_accessibility_outlined,
                      ),
                      const Divider(height: 24, thickness: 1),
                      _buildSimpleListTile('Help', Icons.help_center_outlined),
                      const Divider(height: 24, thickness: 1),
                      _buildSimpleListTile('Log Out', Icons.logout_outlined),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 70, color: AppColors.blackColor),
        Text(
          title,
          style: AppStyles.black16w500Style.copyWith(
            color: AppColors.blackColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleListTile(String title, IconData icon) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.primaryColor,
          child: Icon(icon, size: 20, color: AppColors.blackColor),
        ),
        SizedBox(width: 16),
        Text(title, style: AppStyles.black18BoldStyle),
      ],
    );
  }
}
