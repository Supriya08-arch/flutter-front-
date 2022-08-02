import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:getx/pages/alert/alert_page.dart';
import 'package:getx/pages/home/home_page.dart';
import 'package:getx/pages/news/news_page.dart';
import 'package:getx/pages/acccount/account_page.dart';
// import 'package:getx/pages/alert/alert_page.dart';
// import 'package:getx/pages/home/home_page.dart';
// import 'package:getx/pages/news/news_page.dart';
import 'package:getx/pages/home/home_controller.dart';
import 'package:getx/style/style.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  @override
  // final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            NewsPage(),
            AlertsPage(),
            AccountPage(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: secondaryFontColor,
          selectedItemColor: mainColor,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.favorite,
              label: 'Favorite',
            ),
            _bottomNavigationBarItem(
              icon: Icons.shopping_cart,
              label: 'Cart',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Account',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem(
      {IconData icon = CupertinoIcons.person, String label = "Home"}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
