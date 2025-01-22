import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_pay_u/model/dummy_db.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';
import 'package:instant_pay_u/view/login%20screens/sign%20up/sign_up_screen.dart';
import 'package:instant_pay_u/view/registertion%20screen/registertoionscreen_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingscreenView extends StatefulWidget {
  const OnboardingscreenView({super.key});

  @override
  State<OnboardingscreenView> createState() => _OnboardingscreenViewState();
}

class _OnboardingscreenViewState extends State<OnboardingscreenView> {
  final onboardingData = DummyDb().onboardingData;
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MainLogoWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                "${currentPage + 1} / ${onboardingData.length}",
                style: GoogleFonts.aBeeZee(color: ColorConstant.SECONDARY),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOnboardArea(),
          SmoothPageIndicator(
            controller: pageController,
            count: onboardingData.length,
            effect: WormEffect(
              dotColor: ColorConstant.SECONDARY,
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.underground,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (currentPage == onboardingData.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpScreen()),
                    );
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  currentPage == onboardingData.length - 1
                      ? "Continue"
                      : "Next",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardArea() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                onboardingData[index]["image"]!,
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                onboardingData[index]["title"]!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                onboardingData[index]["description"]!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
