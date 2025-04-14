import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/favourite_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
          child: FloatingActionButton(
              onPressed: (){},
            backgroundColor: Constant.primaryColor,
            shape: CircleBorder(),
            child: Icon(
              Icons.wallet,
              size: 22,
              color: Colors.white,
            ),
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            CupertinoIcons.home,
            CupertinoIcons.cart,
            CupertinoIcons.heart,
            CupertinoIcons.profile_circled,
          ],
          activeIndex: pageIndex,
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Constant.primaryColor,
          elevation: 0,
          rightCornerRadius: 32,
          leftCornerRadius: 32,
          iconSize: 22,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index){
            setState(() {
              pageIndex = index;
            });
          }),
    );
  }
}
