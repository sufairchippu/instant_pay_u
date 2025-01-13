import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';

class MainLogoWidget extends StatelessWidget {
  const MainLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Instant",
          style: GoogleFonts.italiana(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: ColorConstant.PRIMARYCOLOR),
        ),
        Text("PayU",
            style: GoogleFonts.aboreto(
                color: ColorConstant.SECONDARY,
                fontSize: 30,
                fontWeight: FontWeight.w600))
      ],
    );
  }
}