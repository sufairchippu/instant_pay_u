import 'dart:developer';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/bottomnavbarscreen_view.dart';

class RegistertionscreenView extends StatefulWidget {
  const RegistertionscreenView({super.key});

  @override
  State<RegistertionscreenView> createState() => _RegistertionscreenViewState();
}

class _RegistertionscreenViewState extends State<RegistertionscreenView> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedCountryCode = "+91";

  // Validation function for phone numbers
  String? validatePhone(String? phoneNum) {
    if (phoneNum == null || phoneNum.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^\d{10}$').hasMatch(phoneNum)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          MainLogoWidget(),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey, // Attach the formKey to the Form widget
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register Your Phone Number,",
                      style: GoogleFonts.aDLaMDisplay(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "To join with us",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (countryCode) {
                            setState(() {
                              selectedCountryCode = countryCode.dialCode!;
                            });
                          },
                          initialSelection: "IN",
                          favorite: ["+91", "IN"],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "0000000000",
                              labelText: "Phone Number",
                              border: OutlineInputBorder(),
                            ),
                            validator: validatePhone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  """
                             Privacy Policy for [Your App Name]
                                    
                                    Effective Date: [Insert Date]
                                    Last Updated: [Insert Date]
                                    
                                    At [Your App Name], your privacy is of utmost importance to us. This Privacy Policy outlines how we collect, use, store, and share your personal information when you interact with our application. By using our services, you agree to the terms described in this document. We collect and process various types of data to provide and improve our services effectively. This includes personal information like your name, phone number, email address, and financial details such as loan amounts, payment histories, and banking details for processing transactions. We also collect device information, usage statistics, and location data to verify eligibility for specific services, as well as data from third parties such as Google services and authorized credit bureaus for loan assessments. The data collected serves several purposes: to process loan applications, assess eligibility, and manage repayments; to provide personalized experiences and improve app functionalities; to integrate third-party services such as Google for seamless navigation and login; to communicate updates, notifications, and promotional offers relevant to your usage; and to ensure compliance with legal, regulatory, or contractual obligations.
                                    
                                    We do not sell or rent your personal data to third parties. However, we may share your data with trusted third-party vendors who assist in operations such as payment processing, credit assessment, or analytics. We may also disclose your information to comply with applicable laws, regulations, or legal processes and share data with affiliated companies or partners involved in providing financial services or Google app integrations to improve service delivery. We implement industry-standard security measures to protect your personal data from unauthorized access, alteration, disclosure, or destruction. These include encryption of sensitive financial data, regular security audits, and restricted access to personal information for authorized personnel only. Despite our best efforts, no security system is entirely foolproof, and you acknowledge that you use our services at your own risk.
                                    
                                    As a user, you have specific rights regarding your personal information. You can access, review, or update your data through the app’s settings. You may also request a copy of your data in a commonly used electronic format or withdraw consent for data processing at any time, though this may limit your access to certain features. Additionally, you have the right to request the deletion of your personal data, subject to our legal and contractual obligations. Our app integrates with Google services to enhance functionality. The use of Google Maps, Login, or other tools adheres to Google’s privacy policies. For more information, refer to Google Privacy Policy at https://policies.google.com/privacy.
                                    
                                    We retain your personal information for as long as necessary to fulfill the purposes outlined in this policy or as required by law. Once the retention period expires, we securely delete or anonymize the data. We may use cookies, beacons, and similar technologies to track app usage and improve your experience. You can manage your cookie preferences through your device settings. Our app may contain links to third-party websites or services. We are not responsible for their content, privacy policies, or practices. Please review their privacy policies independently.
                                    
                                    We may update this policy periodically to reflect changes in our practices, technologies, or legal requirements. The updated version will be posted in the app, and significant changes will be communicated to you. If you have any questions or concerns about this Privacy Policy, please contact us at [Insert Email Address], [Insert Phone Number], or [Insert Company Address].
                              """,
                                  style: GoogleFonts.abel(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate the form
                        if (formKey.currentState?.validate() ?? false) {
                          log("Phone number: $selectedCountryCode${phoneController.text}");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBarScreen()),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registration Successful')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fix the errors')),
                          );
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
