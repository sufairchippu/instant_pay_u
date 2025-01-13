import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/home%20screen/homescreen_view.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/info%20screen/infoscreen_view.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/loan%20screen/loanscreen_view.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/profile%20screen/profilescreen_view.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 1; // Index for Bottom Navigation Bar

  // List of screens for each tab
  final List<Widget> screens = [
    InfoscreenView(),
    HomescreenView(),
    LoanscreenView(),
    ProfilescreenView()
  ];

  // Method to handle tab changes
  void onItemTapped(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex; // Update the current tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainLogoWidget()
      ),
      body: screens[currentIndex], // Display the selected tab screen
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: ColorConstant.PRIMARYCOLOR,unselectedItemColor: ColorConstant.SECONDARY,
        currentIndex: currentIndex, // Current active tab
        onTap: onItemTapped, // Handle tab change
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.motion_photos_auto_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity_outlined),
            label: 'Instant Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
