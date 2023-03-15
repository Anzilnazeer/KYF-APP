// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyf/model/details_model.dart';

import 'package:kyf/view/utils/app_spaces.dart';

import '../../utils/info/info.dart';
import '../utils/app_colors.dart';

class CardWidget extends StatelessWidget {
  final index;
  final List<DetailsModel> fruitsList;
  const CardWidget({super.key, required this.index, required this.fruitsList});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.44,
      height: screenHeight * 0.37,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                fruitsList[index].name,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset(
              Images.images[index],
              height: screenHeight * 0.1020,
            ),
          ),
          size20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '''Carbohydrate : ${fruitsList[index].nutritions.carbohydrates}\nProtein : ${fruitsList[index].nutritions.protein}\nFat : ${fruitsList[index].nutritions.fat}\nCalories : ${fruitsList[index].nutritions.calories}\nSugar : ${fruitsList[index].nutritions.sugar} ''',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: subtextColor,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: screenWidth * 0.44,
                height: screenHeight * 0.06,
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    'view details',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
