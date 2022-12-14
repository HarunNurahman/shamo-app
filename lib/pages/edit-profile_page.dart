import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/pages/widgets/edit-profile_input.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/providers/auth_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.user;

    // Header Widget
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        // Close Button
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close_rounded,
            color: primaryTextColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        // Header Title
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        // Check or Save Button
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_rounded,
              color: primaryColor,
            ),
          )
        ],
      );
    }

    Widget content() {
      // Profile Picture Widget
      Widget profilePicture() {
        return Center(
          child: CircleAvatar(
            radius: defaultMargin + 20, // 30 + 20
            backgroundImage: NetworkImage(
              userModel.profilePhotoUrl.toString(),
            ),
          ),
        );
      }

      // TextField Widget
      Widget inputType() {
        return Column(
          children: [
            EditProfileInput(
              title: 'Full Name',
              hint: '${userModel.name}',
            ),
            EditProfileInput(
              title: 'Username',
              hint: '@${userModel.username}',
            ),
            EditProfileInput(
              title: 'Email',
              hint: '${userModel.email}',
            ),
          ],
        );
      }

      return Column(
        children: [
          profilePicture(),
          inputType(),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor3,
      appBar: header(),
      body: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: content(),
      ),
    );
  }
}
