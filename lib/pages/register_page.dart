import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/widgets/loading-button_widget.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/config/themes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isObsecure = false;

  @override
  void initState() {
    isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // Function untuk menghandle button register dan mengirim data ke AuthProvider
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Get.offAllNamed('/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Registrasi Gagal',
              style: primaryTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

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
            // Container(
            //   height: 50,
            //   margin: const EdgeInsets.only(bottom: 20),
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   decoration: BoxDecoration(
            //     color: bgColor2,
            //     borderRadius: BorderRadius.circular(defaultRadius),
            //     border: Border.all(color: primaryColor),
            //   ),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/icons/ic_name.png',
            //           width: 17,
            //         ),
            //         const SizedBox(width: 16),
            //         Expanded(
            //           child: TextFormField(
            //             controller: nameController,
            //             style: primaryTextStyle,
            //             autocorrect: false,
            //             enableSuggestions: false,
            //             decoration: InputDecoration.collapsed(
            //               hintText: 'Your Full Name',
            //               hintStyle: subtitleTextStyle,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              child: TextFormField(
                autocorrect: false,
                style: primaryTextStyle,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                obscureText: false,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Your Full Name',
                  hintStyle: subtitleTextStyle,
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  fillColor: bgColor2,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: primaryColor),
                  ),
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
            // Container(
            //   height: 50,
            //   margin: const EdgeInsets.only(bottom: 20),
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   decoration: BoxDecoration(
            //     color: bgColor2,
            //     borderRadius: BorderRadius.circular(defaultRadius),
            //   ),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/icons/ic_username.png',
            //           width: 17,
            //         ),
            //         const SizedBox(width: 16),
            //         Expanded(
            //           child: TextFormField(
            //             controller: usernameController,
            //             style: primaryTextStyle,
            //             autocorrect: false,
            //             enableSuggestions: false,
            //             decoration: InputDecoration.collapsed(
            //               hintText: 'Your Username',
            //               hintStyle: subtitleTextStyle,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              child: TextFormField(
                autocorrect: false,
                style: primaryTextStyle,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                obscureText: false,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Your Username',
                  hintStyle: subtitleTextStyle,
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  fillColor: bgColor2,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.abc,
                    color: primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: primaryColor),
                  ),
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
            // Container(
            //   height: 50,
            //   margin: const EdgeInsets.only(bottom: 20),
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   decoration: BoxDecoration(
            //     color: bgColor2,
            //     borderRadius: BorderRadius.circular(defaultRadius),
            //   ),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/icons/ic_email.png',
            //           width: 17,
            //         ),
            //         const SizedBox(width: 16),
            //         Expanded(
            //           child: TextFormField(
            //             controller: emailController,
            //             style: primaryTextStyle,
            //             autocorrect: false,
            //             enableSuggestions: false,
            //             decoration: InputDecoration.collapsed(
            //               hintText: 'Your Email Address',
            //               hintStyle: subtitleTextStyle,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              child: TextFormField(
                autocorrect: false,
                style: primaryTextStyle,
                enableSuggestions: false,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  hintStyle: subtitleTextStyle,
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  fillColor: bgColor2,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: primaryColor),
                  ),
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
            // Container(
            //   height: 50,
            //   margin: const EdgeInsets.only(bottom: 30),
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   decoration: BoxDecoration(
            //     color: bgColor2,
            //     borderRadius: BorderRadius.circular(defaultRadius),
            //   ),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/icons/ic_password.png',
            //           width: 17,
            //         ),
            //         const SizedBox(width: 16),
            //         Expanded(
            //           child: TextFormField(
            //             controller: passwordController,
            //             style: primaryTextStyle,
            //             obscureText: true,
            //             decoration: InputDecoration.collapsed(
            //               hintText: 'Your Password',
            //               hintStyle: subtitleTextStyle,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              child: TextFormField(
                autocorrect: false,
                style: primaryTextStyle,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                obscureText: !isObsecure,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: Theme(
                    data: ThemeData(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: transparentColor,
                      highlightColor: transparentColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      icon: Icon(
                        isObsecure ? Icons.visibility : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  hintText: 'Your Password',
                  hintStyle: subtitleTextStyle,
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  fillColor: bgColor2,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: primaryColor),
                  ),
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
            onPressed: handleSignUp,
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

      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameInput(),
                usernameInput(),
                emailInput(),
                passwordInput(),
                isLoading ? LoadingButton() : submitButton(),
              ],
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin, top: defaultMargin),
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
      backgroundColor: bgColor1,
      body: SafeArea(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
