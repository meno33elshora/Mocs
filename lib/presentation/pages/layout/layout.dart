import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/di/injection.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../setting_screen/notifications_screen.dart';
import 'controller/layout_provider.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(builder: (context, layoutProvider, child) {
      return Scaffold(
        drawerScrimColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const TextWidget(
            txt: 'Mocs Shop',
            fontSize: 18.0,
            color: Colors.white,
            notFontFamily: true,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          // actions: [
          //   Badge(
          //     backgroundColor: Colors.red,
          //     alignment: AlignmentDirectional.topStart,
          //     label: const TextWidget(
          //         txt: '0',
          //         fontSize: 12.0,
          //         color: Colors.white,
          //         notFontFamily: true),
          //     child: IconButton(
          //       onPressed: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen(notificationModel: getIt())));
          //       },
          //       icon: const Icon(
          //         Icons.notifications,
          //         color: Colors.white,
          //       ),
          //       padding: const EdgeInsets.all(5.0),
          //     ),
          //   ),
          // ],
        ),
        body: layoutProvider.layoutScreens[layoutProvider.bottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: layoutProvider.bottomNavIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: 'NotoKufiArabic', fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(
              fontFamily: 'NotoKufiArabic', fontWeight: FontWeight.w400),
          onTap: (index) {
            layoutProvider.changeBottomNavIndex(index: index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            // BottomNavigationBarItem(icon: Icon(Icons.notification_add), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Setting"),
          ],
        ),
      );
    });
  }
}
