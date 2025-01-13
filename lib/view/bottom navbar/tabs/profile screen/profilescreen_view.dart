import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';

class ProfilescreenView extends StatefulWidget {
  const ProfilescreenView({super.key});

  @override
  State<ProfilescreenView> createState() => _ProfilescreenViewState();
}

class _ProfilescreenViewState extends State<ProfilescreenView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 55,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Name "), Text("@gmail.com")],
              ),
              Spacer(),
              Icon(Icons.mode_edit_outline_outlined)
            ],
          ),
          SizedBox(height: 35),
          Row(
            children: [Text("Phone : "), Text("example phone num")],
          ),
          Row(
            children: [Text("UPI id: "), Text("example upi id")],
          ),
          Row(
            children: [
              Text(
                "Instant Upi Type :",
                style: TextStyle(),
              ),
              Text("personal/bussines")
            ],
          ),
          Row(
            children: [
              Text("Linked Acouount "),
            ],
          ),
          Row(
            children: [Text("location: "), Text("india")],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Instant PayU Loan"),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Instant PayU coins"),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Instant PayU Rewards"),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Text("settings"),
          Text("About"),
          Text("Help Center"),
          SizedBox(height: 25,),Spacer(),
          Text("Logout",style: TextStyle(color: Colors.redAccent.shade700),),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.account_balance_sharp),MainLogoWidget()],)],
      ),
    );
  }
}
