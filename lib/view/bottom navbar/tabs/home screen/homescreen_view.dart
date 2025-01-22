import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_pay_u/model/dummy_db.dart';
import 'package:instant_pay_u/services/utilities/color_constant.dart';
import 'package:instant_pay_u/services/utilities/image_constant.dart';
import 'package:instant_pay_u/view/bottom%20navbar/tabs/home%20screen/qr_code_scanner.dart';
import 'package:instant_pay_u/view/one%20one%20screen/one_onescreen_view.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({super.key});

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final dummdatatransMethod = DummyDb().transferMethode;
  int personTransNum = 2;
  int personTransNumMax = 5; //DummyDb().transferMethode.length

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 12, bottom: 13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0), // Padding for better spacing
                margin: EdgeInsets.all(8.0), // Margin around the container
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.2), // Subtle shadow effect
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, color: Colors.blue), // Search icon
                    hintText:
                        "Search number or pay to the contact", // Placeholder text
                    hintStyle: TextStyle(color: Colors.grey), // Hint text style
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0), // Vertical padding for input field
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(onDoubleTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodeScanner(),));
                
              },
                child: Container(
                    height: 150,
                    width: double.infinity,
                    child: Stack(children: [
                      Center(child: Image.asset(ImageConstant.RANDOMSTACK1)),
                      Positioned(top: 25,left: 148,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_scanner_sharp,
                              size: 95,
                              color: ColorConstant.PRIMARYCOLOR2,
                            ),
                            SizedBox(width: 25),
                            Text(
                              "Scan it \n Pay it",
                              style: GoogleFonts.asar(fontSize: 25),
                            ),
                          ],
                        ),
                      )
                    ])),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            CircleAvatar(
                                backgroundColor: ColorConstant.PRIMARYCOLOR2,
                                radius: 35,
                                child: Icon(
                                  dummdatatransMethod[index]["icon"],
                                  size: 50,
                                  color: ColorConstant.SECONDARY2,
                                )),
                            Text(dummdatatransMethod[index]["title"])
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            CircleAvatar(
                                radius: 35,
                                backgroundColor: ColorConstant.PRIMARYCOLOR2,
                                child: Icon(
                                  dummdatatransMethod[index + 3]["icon"],
                                  size: 50,
                                  color: ColorConstant.SECONDARY2,
                                )),
                            Text(dummdatatransMethod[index + 3]["title"])
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Text(
                "Recent person Transaction",
                style: GoogleFonts.spaceGrotesk(),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Stack(
                  children: [
                    Column(
                      children: List.generate(
                        personTransNum, // Number of rows
                        (rowIndex) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4, // Number of items per row
                            (colIndex) {
                              int itemIndex = rowIndex * 4 + colIndex;
                              if (itemIndex < dummdatatransMethod.length) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OneOnescreenView(),
                                            ));
                                      },
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            ColorConstant.PRIMARYCOLOR2,
                                        child: Icon(
                                          dummdatatransMethod[itemIndex]
                                              ["icon"],
                                          color: ColorConstant.SECONDARY2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(dummdatatransMethod[itemIndex]
                                        ["title"]),
                                  ],
                                );
                              } else {
                                return SizedBox
                                    .shrink(); // Empty space for non-existing items
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //the button more people
                      right: 0,
                      bottom: 29,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            personTransNum =
                                (personTransNum == 2) ? personTransNumMax : 2;
                            // Increase the number of rows to 6
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          child: Icon(personTransNum != personTransNumMax
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
