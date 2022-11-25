import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/widgets/edit-profile_input.dart';
import 'package:shamo/themes.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            backgroundImage: const AssetImage(
              'assets/icons/ic_profile_pic.png',
            ),
          ),
        );
      }

      // TextField Widget
      Widget inputType() {
        return Column(
          children: const [
            EditProfileInput(
              title: 'Full Name',
              hint: 'Harun Nurahman',
            ),
            EditProfileInput(
              title: 'Username',
              hint: '@harunamanya',
            ),
            EditProfileInput(
              title: 'Email',
              hint: 'harun.nurrahman@gmail.com',
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
