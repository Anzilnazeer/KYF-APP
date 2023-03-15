import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyf/model/details_model.dart';

import 'package:kyf/view/utils/app_spaces.dart';

import '../../utils/info/info.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class FruitDetails extends StatelessWidget {
  final index;
  final List<DetailsModel> fruitsList;
  const FruitDetails(
      {super.key, required this.index, required this.fruitsList});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          toolbarHeight: 35,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.angleLeft,
              color: buttonColor,
            ),
            onPressed: () => Get.back(),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fruitsList[index].name,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  Center(
                    child: Image.asset(
                      Images.detailImage[index],
                      height: screenHeight * 0.24,
                    ),
                  ),
                  Text(
                    '''The ${fruitsList[index].name} is a medium-sized, evergreen tree in the ${fruitsList[index].family}  family. It is native to the Americas and was first domesticated by Mesoamerican tribes more than ${index * 215 + 5000} years ago.''',
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: subtextColor),
                  ),
                ],
              ),
            ),
            size10,
            Container(
              width: double.infinity,
              height: screenHeight / 4.7,
              decoration: const BoxDecoration(color: containerColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    size10,
                    Text(
                      nutrients,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    size5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '''Carbohydrates\nProtein\nFat\nCalories\nSugar''',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: subtextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              ''':\n:\n:\n:\n:''',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: subtextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '''${fruitsList[index].nutritions.carbohydrates}\n${fruitsList[index].nutritions.protein}\n${fruitsList[index].nutritions.fat}\n${fruitsList[index].nutritions.calories}\n${fruitsList[index].nutritions.sugar}''',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: subtextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Benefits',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  size5,
                  Text(
                    '1. Healthy for the heart\n2. Great for vision.\n3. May help prevent osteoporosis\n4. Components may prevent cancer\n5. Supporting fetal health\n6. Reducing depression risk\n7. Improving digestion\n',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: buttonColor,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  size10
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
