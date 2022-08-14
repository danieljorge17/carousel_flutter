import 'package:carousel_flutter/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

RxInt _current = 0.obs;

List<String> imagePath = [
  "assets/assassin_cross.jpg",
  "assets/high_ wizard.jpg",
  "assets/lord_knight.jpg",
  "assets/sniper.jpg",
  "assets/white_smith.jpg"
];

CarouselController buttonCarouselController = CarouselController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/background.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                carouselController: buttonCarouselController,
                items: [
                  for (String eachImagePath in imagePath)
                    CarouselImage(image: eachImagePath)
                ],
                options: CarouselOptions(
                  onPageChanged: (index, reason) => _current.value = index,
                  height: 240.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                child: Obx(() {
                  return AnimatedSmoothIndicator(
                    onDotClicked: (index) =>
                        buttonCarouselController.jumpToPage(index),
                    activeIndex: _current.value,
                    count: imagePath.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Color(0x66FFFFFF),
                        activeDotColor: Color(0xFFFFFFFF),
                        dotWidth: 8,
                        dotHeight: 8),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
