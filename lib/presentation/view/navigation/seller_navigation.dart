// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/information/seller_information_page.dart';
import 'package:keiko_good_day/presentation/view/purchase/purchase_page.dart';

class SellerNavigation extends StatefulWidget {
  const SellerNavigation({Key? key}) : super(key: key);

  @override
  State<SellerNavigation> createState() => _SellerNavigationState();
}

class _SellerNavigationState extends State<SellerNavigation> {
  final bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_rounded), label: 'Pembelian'),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Informasi'),
  ];

  final _selectedIndex = ValueNotifier(0);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PurchasePage(),
    );
    // return ValueListenableBuilder<int>(
    //     valueListenable: _selectedIndex,
    //     builder: (context, value, child) {
    //       return Scaffold(
    //         body: NavBarPageView(
    //             controller: pageController, onPageChange: onPageChange),
    //         bottomNavigationBar: BottomNavigationBar(
    //           items: bottomNavigationBarItems,
    //           currentIndex: value,
    //           type: BottomNavigationBarType.fixed,
    //           showUnselectedLabels: true,
    //           selectedItemColor: Theme.of(context).primaryColor,
    //           onTap: onBottomTap,
    //         ),
    //       );
    //     });
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
        children: const [PurchasePage(), SellerInformationPage()]);
  }
}
