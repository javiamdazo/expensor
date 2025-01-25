import 'package:expensor/pages/dashboard/dashboard_page.dart';
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
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  final NavBarStyle _navBarStyle = NavBarStyle.style7;

  List<Widget> _buildScreens() {
    return const [
      DashboardPage(),
      Text("Posicion Global"),
      Text("Add"),
      Text("Inversion"),
      Text("Budget")
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
          inactiveColorSecondary: CupertinoColors.systemGrey,
          scrollController: _scrollController1),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const DashboardPage(),
            "/second": (final context) => const Text("jose"),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const DashboardPage(),
            "/second": (final context) => const Text("jose"),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const DashboardPage(),
            "/second": (final context) => const Text("jose"),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const DashboardPage(),
            "/second": (final context) => const Text("jose"),
          },
        ),
      ),
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
      backgroundColor: const Color.fromARGB(255, 17, 48, 75),
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
