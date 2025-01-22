import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';

class ProfilescreenView extends StatefulWidget {
  const ProfilescreenView({super.key});

  @override
  State<ProfilescreenView> createState() => _ProfilescreenViewState();
}

class _ProfilescreenViewState extends State<ProfilescreenView> {

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      "https://via.placeholder.com/150", // Placeholder image
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.fahkwang(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "@gmail.com",
                          style: GoogleFonts.fahkwang(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Edit profile action
                    },
                    child: Icon(Icons.mode_edit_outline_outlined),
                  ),
                ],
              ),
              SizedBox(height: 35),
              _buildInfoRow("UPI ID:", "example@upi"),
              _buildInfoRow("Phone:", "000000000"),
              _buildInfoRow("Instant UPI Type:", "Personal/Business"),
              _buildInfoRow("Linked Account:", "Example Account"),
              _buildInfoRow("Location:", "India"),
              SizedBox(height: 40),
              _buildActionRow("Instant PayU Loan", Icons.arrow_forward_ios_outlined),
              _buildActionRow("Instant PayU Coins", Icons.arrow_forward_ios_outlined),
              _buildActionRow("Instant PayU Rewards", Icons.arrow_forward_ios_outlined),
              SizedBox(height: 35),
              Text("Settings", style: GoogleFonts.aBeeZee(fontSize: 16)),
              Text("About", style: GoogleFonts.aBeeZee(fontSize: 16)),
              Text("Help Center", style: GoogleFonts.aBeeZee(fontSize: 16)),
              SizedBox(height: 25),
              Center(
                child: InkWell(onTap: () {
    showAboutDialog(context: context);
                },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.redAccent.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance_sharp),
                  SizedBox(width: 8),
                  MainLogoWidget(),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label ",
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.fahkwang(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(icon, size: 20),
        ],
      ),
    );
  }
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle logout action
                Navigator.pop(context);
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

}
