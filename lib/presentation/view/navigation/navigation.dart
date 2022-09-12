import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/confirmation/confirmation_page.dart';
import 'package:keiko_good_day/presentation/view/gift/gift_page.dart';
import 'package:keiko_good_day/presentation/view/information/information_page.dart';
import 'package:keiko_good_day/presentation/view/visit/visit_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.two_wheeler_rounded), label: 'Kunjungan'),
    BottomNavigationBarItem(
        icon: Icon(Icons.meeting_room), label: 'Konfirmasi'),
    BottomNavigationBarItem(icon: Icon(Icons.redeem_rounded), label: 'Hadiah'),
    // BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Informasi'),
  ];

  final _selectedIndex = ValueNotifier(0);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
              body: NavBarPageView(
                  controller: pageController, onPageChange: onPageChange),
              bottomNavigationBar: BottomNavigationBar(
                  items: bottomNavigationBarItems,
                  currentIndex: value,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  selectedItemColor: Theme.of(context).primaryColor,
                  onTap: onBottomTap));
        });
  }

  void onBottomTap(int index) {
    _selectedIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 100), curve: Curves.ease);
  }

  Future<void> onPageChange(int index) async {
    _selectedIndex.value = index;
  }
}

class NavBarPageView extends StatelessWidget {
  const NavBarPageView(
      {Key? key, required this.controller, required this.onPageChange})
      : super(key: key);

  final PageController controller;
  final Function(int index) onPageChange;

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: controller,
        onPageChanged: onPageChange,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          VisitPage(),
          ConfirmationPage(),
          GiftPage(),
          InformationPage()
        ]);
  }
}
