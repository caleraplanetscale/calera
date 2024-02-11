// DART
import 'package:calera/app/container/Page.dart';
import 'package:calera/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int iPage = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose;
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      iPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      backgroundColor: white,
      bottomNavigationBar: SizedBox(
        height: 37,
        child: Center(
          child: CupertinoTabBar(
            backgroundColor: white,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, left: 0, right: 0),
                  child: Column(
                    children: [
                      iPage == 0
                          ? SvgPicture.asset(
                              'assets/svg/home_selected.svg',
                              width: 18,
                              height: 18,
                            )
                          : SvgPicture.asset(
                              'assets/svg/home_unselected.svg',
                              width: 18,
                              height: 18,
                            ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, left: 0, right: 0),
                  child: Column(
                    children: [
                      iPage == 1
                          ? SvgPicture.asset(
                              'assets/svg/search_selected.svg',
                              width: 18,
                              height: 18,
                            )
                          : SvgPicture.asset(
                              'assets/svg/search_unselected.svg',
                              width: 18,
                              height: 18,
                            ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, left: 0, right: 0),
                  child: Column(
                    children: [
                      iPage == 2
                          ? SvgPicture.asset(
                              'assets/svg/client_selected.svg',
                              width: 19.5,
                              height: 20,
                            )
                          : SvgPicture.asset(
                              'assets/svg/client_unselected.svg',
                              width: 18.5,
                              height: 18.5,
                            ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, left: 0, right: 0),
                  child: Column(
                    children: [
                      iPage == 3
                          ? SvgPicture.asset(
                              'assets/svg/message_selected.svg',
                              width: 15,
                              height: 15,
                            )
                          : SvgPicture.asset(
                              'assets/svg/message_unselected.svg',
                              width: 15,
                              height: 15,
                            ),
                    ],
                  ),
                ),
                backgroundColor: white,
              ),
            ],
            onTap: navigationTapped,
            border: const Border(
              top: BorderSide(
                width: 0.6,
                color: Color.fromARGB(255, 213, 212, 212),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
