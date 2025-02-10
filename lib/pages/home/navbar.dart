import 'package:expensor/pages/accounts/accounts.dart';
import 'package:expensor/pages/dashboard/dashboard_background.dart';
import 'package:expensor/pages/dashboard/dashboard_page.dart';
import 'package:expensor/widgets/color_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final ScrollController _scrollController = ScrollController();

  final NavBarStyle _navBarStyle = NavBarStyle.style7;

  void changeTab(int index) {
    setState(() {
      _controller.index = index; // Change the tab
    });
  }

  List<Widget> _buildScreens() {
    return [
      DashboardPage(changeTab: changeTab),
      Center(
        child: Text("Bugdet"),
      ),
      Accounts(),
      Center(
        child: Text("settings"),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home_filled,
          ),
          title: "Home",
          contentPadding: 5.0,
          activeColorPrimary: Theme.of(context).primaryColor,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          scrollController: _scrollController),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.pie_chart_outline_rounded),
          title: ("Budget"),
          contentPadding: 5.0,
          activeColorPrimary: Theme.of(context).primaryColor,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          scrollController: _scrollController),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.wallet),
          title: ("Accounts"),
          activeColorPrimary: Theme.of(context).primaryColor,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          scrollController: _scrollController),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: Theme.of(context).primaryColor,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          scrollController: _scrollController),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      handleAndroidBackButtonPress: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: _navBarStyle,
    );
  }
}
