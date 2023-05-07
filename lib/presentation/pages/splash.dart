import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mocs/presentation/pages/layout/layout.dart';
import 'package:mocs/presentation/pages/login.dart';
import 'package:mocs/presentation/pages/on_borading.dart';
import 'package:mocs/presentation/state_provider/get_home_data_provider.dart';
import 'package:mocs/utils/constants/constants.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/local/shared_Pref_Helper.dart';
import '../../utils/constants/enums.dart';

bool boardingShown = false;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void onBoarding() {
    boardingShown = CacheHelper.getData(key: 'isBoard') ?? false;
    if (boardingShown == true) {
      isLogin();
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          (route) => false);
    }
  }

  void isLogin() {
    if (token!.isNotEmpty && token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Layout()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      onBoarding();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // height: context.height / 1,
        // width: context.width / 1,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/shop.png',
              width: 100,
              height: 100,
            ),
            20.ph,
            const Text(
              'Mocs Shop',
              style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  letterSpacing: 3.0),
            ),
           // LoadingData.LOADING == Provider.of<GetHomeDataProvider>(context).loadingData ?   SpinKitRotatingCircle(
           //    color: Colors.green,
           //    size: 50.0,
           //  ) : Container(),
          ],
        ),
      ).center,
    );
  }
}
