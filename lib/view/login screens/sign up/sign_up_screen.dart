import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';
import 'package:instant_pay_u/view/login%20screens/sign%20in/signIn_screen.dart';
import 'package:instant_pay_u/view/registertion%20screen/registertoionscreen_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  int errorCount = 0;
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  /// Void function to validate the email field
  void emailValidation() {
    String value = emailController.text;
    if (value.isEmpty) {
      emailError = 'Email cannot be empty';
      errorCount++;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      emailError = 'Enter a valid email address';
      errorCount++;
    } else {
      emailError = '';
    }
  }

  /// Void function to validate the password field
  void passwordValidation() {
    String value = passwordController.text;
    if (value.isEmpty) {
      passwordError = 'Password cannot be empty';
      errorCount++;
    } else if (value.length < 6) {
      passwordError = 'Password must be at least 6 characters';
      errorCount++;
    } else {
      passwordError = '';
    }
  }

  /// Void function to validate the confirm password field
  void confirmPasswordValidation() {
    String value = passwordConfirmController.text;
    if (value.isEmpty) {
      confirmPasswordError = 'Confirm Password cannot be empty';
      errorCount++;
    } else if (value != passwordController.text) {
      confirmPasswordError = 'Passwords do not match';
      errorCount++;
    } else {
      confirmPasswordError = '';
    }
  }

  /// Void function to validate all fields
  void validateAndSubmit() {
    setState(() {
      errorCount = 0;
      emailValidation();
      passwordValidation();
      confirmPasswordValidation();
    });

    if (errorCount == 0) {
      // Proceed with Sign-Up logic (e.g., API call)
      print('All validations passed. Proceed with Sign-Up.');
    } else {
      print('Validation failed. Errors found: $errorCount');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new),
        title: MainLogoWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign Up for Instant PayU",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            Container(decoration: BoxDecoration(border: Border.all(width: 15,color: ColorConstant.PRIMARYCOLOR2),borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(suffixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  errorText: emailError.isNotEmpty ? emailError : null,
                ),
              ),
            ),
            const SizedBox(height: 50),
                Container(decoration: BoxDecoration(border: Border.all(width: 12,color: ColorConstant.PRIMARYCOLOR2),borderRadius: BorderRadius.circular(20)),

              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  errorText: passwordError.isNotEmpty ? passwordError : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
                       Container(decoration: BoxDecoration(border: Border.all(width: 12,color: ColorConstant.PRIMARYCOLOR2),borderRadius: BorderRadius.circular(20)),

              child: TextField(
                controller: passwordConfirmController,
                obscureText: true,
                              decoration: InputDecoration(suffixIcon: Icon(Icons.remove_red_eye_outlined),
              
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  errorText: confirmPasswordError.isNotEmpty
                      ? confirmPasswordError
                      : null,
                ),
              ),
            ),
          SizedBox(height: 40),
            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    InkWell(
      onTap: () {
        setState(() {
          validateAndSubmit(); // Validate fields
        });

        if (errorCount == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegistertionscreenView(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please fix the errors before proceeding'),
            ),
          );
        }
      },
      child: Container(
        height: 35,
        width: 85,
        decoration: BoxDecoration(
          color: ColorConstant.PRIMARYCOLOR2,
          borderRadius:  BorderRadius.all(Radius.circular(4)),
        ),
        child:  Center(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ],
),
      SizedBox(height: 140,),      
MainLogoWidget(),
Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninScreen(),
                        ));
                  },
                  child:  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
             SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}
