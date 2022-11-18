import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/themes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Register and Happy Shopping',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget textInput() {
      // Full Name Text Field
      Widget nameInput() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_name.png',
                      width: 17,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }

      // Username Text Field
      Widget usernameInput() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_username.png',
                      width: 17,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }

      // Email Text Field Widget
      Widget emailInput() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_email.png',
                      width: 17,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }

      // Password Text Field Widget
      Widget passwordInput() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_password.png',
                      width: 17,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }

      // Submit Button Widget
      Widget submitButton() {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/dashboard');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              submitButton(),
            ],
          )
        ],
      );
    }

    Widget footer() {
      return Padding(
        padding: EdgeInsets.only(bottom: defaultMargin),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Already have an account?',
              style: subtitleTextStyle.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed('/login'),
                  text: ' Sign In',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: primaryColor,
                    fontWeight: semibold,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              textInput(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
