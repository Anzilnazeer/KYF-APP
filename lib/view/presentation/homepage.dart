import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyf/controller/api_module/apimodule.dart';
import 'package:kyf/model/details_model.dart';

import 'package:kyf/view/presentation/details.dart';
import 'package:kyf/view/utils/app_colors.dart';
import 'package:kyf/view/utils/app_spaces.dart';
import 'package:kyf/view/utils/app_string.dart';
import 'package:kyf/view/widgets/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../widgets/card_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DetailsModel> fruitsList = [];
  @override
  void initState() {
    super.initState();
    fetchdetail();
  }

  fetchdetail() async {
    final fruits = await ApiModule.fetchDetails();
    setState(() {
      fruitsList = fruits;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        toolbarHeight: 35,
        elevation: 0,
        leading: const Icon(
          FontAwesomeIcons.angleLeft,
          color: buttonColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fruitlist,
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
              size5,
              Text(details,
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: textColor)),
              size20,
              // CardWidget(),

              FutureBuilder<List<DetailsModel>>(
                  future: ApiModule.fetchDetails(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio:
                                screenHeight * 0.473 / screenHeight * 1.207,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                        itemCount: 4,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FruitDetails(
                                    fruitsList: fruitsList,
                                    index: index,
                                  ),
                                ));
                              },
                              child: fruitsList.isNotEmpty
                                  ? CardWidget(
                                      fruitsList: fruitsList,
                                      index: index,
                                    )
                                  : Center(
                                      child: Shimmer(
                                      color: const Color.fromARGB(
                                          255, 188, 188, 188),
                                      child: Skeleton(
                                        width: screenWidth * 0.44,
                                        height: screenHeight * 0.37,
                                      ),
                                    )));
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
