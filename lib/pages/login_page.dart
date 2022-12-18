import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/pages/widgets/loading-button_widget.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecure = false;
  bool isLoading = false;

  @override
  void initState() {
    isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // Function untuk menghandle button login dan mengirim data ke AuthProvider
    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        // Session
        // final SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();
        // sharedPreferences.setString('token', emailController.text);

        Get.offAllNamed('/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Login Gagal',
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

    // Header Widget
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Sign In',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 2),
            // Subtitle
            Text(
              'Please Sign In to Continue',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    // List of Text Field
    Widget textInput() {
      // Email Text Field Widget
      Widget emailInput() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
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
            // Title
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
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
            onPressed: handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Sign In',
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
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : submitButton(),
            ],
          )
        ],
      );
    }

    // Register Button
    Widget footer() {
      return Padding(
        padding: EdgeInsets.only(bottom: defaultMargin),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account?',
              style: subtitleTextStyle.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed('/register'),
                  text: ' Sign Up',
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
