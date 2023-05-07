import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/presentation/pages/login.dart';
import 'package:mocs/presentation/pages/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/data_source/local/shared_Pref_Helper.dart';
import '../widgets/text_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

List<String> title = ["You Are Welcome", "Speed Delivery", "Secure Payment"];

List<String> description = [
  "Hello,Hope you are happy with us",
  " We are characterized by\nfast shipping and delivery",
  "Your payments are safe"
];

List<IconData> iconPage = [
  CupertinoIcons.waveform_path_ecg,
  CupertinoIcons.car,
  CupertinoIcons.money_dollar
];

List<String> image = [
  "assets/images/1.png",
  "assets/images/2.png",
  "assets/images/3.png",
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  PageController pageController1 = PageController();

  bool isLatest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const TextWidget(
          txt: "OnBoarding",
          color: Colors.green,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          notFontFamily: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.white,
            child: PageView.builder(
              onPageChanged: (val) {
                setState(() {
                  if (val == iconPage.length - 1) {
                    setState(() {
                      isLatest = true;
                    });
                  } else {
                    setState(() {
                      isLatest = false;
                    });
                  }
                });
              },
              controller: pageController,
              itemBuilder: (BuildContext context, int index) =>
                  Image(image: AssetImage(image[index])),
              // Icon(
              //   iconPage[index],
              //   color: MyColor.green,
              //   size: 200,
              // ),
              itemCount: iconPage.length,
              physics: const BouncingScrollPhysics(),
            ),
          )),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (val) {
                      setState(() {
                        if (val == iconPage.length - 1) {
                          setState(() {
                            isLatest = true;
                          });
                        } else {
                          setState(() {
                            isLatest = false;
                          });
                        }
                      });
                    },
                    controller: pageController1,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        TextWidget(
                          txt: title[index],
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          notFontFamily: true,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextWidget(
                          txt: description[index],
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          notFontFamily: true,
                        ),
                      ],
                    ),
                    itemCount: iconPage.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: pageController,
                          count: iconPage.length,
                          effect: const WormEffect(
                            radius: 10,
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 15,
                            activeDotColor: Colors.green,
                            dotColor: Colors.amber,
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              if (isLatest ) {
                                CacheHelper.saveData(key: "isBoard", value: true).then((value) {
                                  if(value== true){
                                    Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
                                        builder: (context) => const Login()), (route) => false);
                                  }
                                }).catchError((error){
                                      debugPrint("$error **********");
                                });

                              } else {
                                pageController.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.linearToEaseOut);
                                pageController1.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.linearToEaseOut);
                              }
                            },
                            child: const TextWidget(
                              txt: "Next",
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.white,
                              notFontFamily: true,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
