import 'package:flutter/cupertino.dart';
import '../../cart_screen.dart';
import '../../category_screen.dart';
import '../../favourite_screen.dart';
import '../../home_screen.dart';
import '../../profile_screen.dart';
import '../../setting_screen/setting_screen.dart';

class LayoutProvider extends ChangeNotifier{
  int bottomNavIndex = 0;
  List<Widget> layoutScreens = const [
    HomeScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    CartScreen(),
    SettingScreen()
  ];
  void changeBottomNavIndex({required int index}) {
    bottomNavIndex = index;
    notifyListeners();
  }
}