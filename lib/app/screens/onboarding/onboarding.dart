import 'package:flutter_svg/flutter_svg.dart';
import 'package:idchecktrue/app/screens/onboarding/data/data.dart';
import 'dart:io' show Platform;
import 'package:idchecktrue/constants.dart';
import 'package:flutter/material.dart';
import 'package:idchecktrue/app/screens/Welcome/welcome_screen.dart';
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              slides[index].getImageAssetPath(),
              slides[index].getTitle(),
              slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(microseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text("SKIP"),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(microseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text("NEXT"),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: Platform.isIOS ? 70 : 60,
              color: kPrimaryColor,//F9A826
              child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WelcomeScreen()),
                          );
          },
              child: Text(
                "GET STARTED NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile(this.imageAssetPath, this.title, this.desc);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           SvgPicture.asset(
              imageAssetPath,
              height: size.height * 0.45,
            ),
          
          SizedBox(
            height: 20,
          ),
          Text(title),
          SizedBox(
            height: 10,
          ),
          Text(desc),
        ],
      ),
    );
  }
}
