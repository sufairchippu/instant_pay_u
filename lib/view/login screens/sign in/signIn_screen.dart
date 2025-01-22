import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/bottomnavbarscreen_view.dart';
import 'package:instant_pay_u/view/login%20screens/forget%20password/forget_password_screen.dart';
import 'package:instant_pay_u/view/login%20screens/sign%20up/sign_up_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    bool isopen = true;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new_rounded),title: MainLogoWidget()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!, Sir',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 12, color: ColorConstant.PRIMARYCOLOR2),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 12, color: ColorConstant.PRIMARYCOLOR2),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
             Row(mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ForgotPasswordScreen()),
                    );
                  },
                  child:  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                             ),
               ],
             ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBarScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                        child: Container(
                          width: 300,
                          height: 35,
                         decoration: BoxDecoration(   color: ColorConstant.PRIMARYCOLOR2,borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            )))),
              ],
            ),
            const SizedBox(height: 10),
           
          Spacer(),
          MainLogoWidget(),
          SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
