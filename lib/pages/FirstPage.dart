import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes/pages/RegisterPage.dart';
import 'package:tubes/pages/LoginPage.dart';
import 'package:tubes/pages/Home.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int pageIndex = 2;

  List<Widget> pages = [
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 0, 195, 137),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.archivebox_fill,
      CupertinoIcons.chart_bar_square_fill,
      CupertinoIcons.house_alt_fill,
      CupertinoIcons.creditcard_fill,
      CupertinoIcons.person_2_fill,
    ];
    List<String> iconLabels = [
      'Funding',
      'My Invest',
      'Home',
      'Wallet',
      'Account',
    ];
    return Container(
      color: Color.fromARGB(100, 0, 195, 137),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(iconItems.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setTabs(index);
              },
              child: Container(
                color: pageIndex == index ? Color(0xFFdbe4f3) : null,
                padding: EdgeInsets.all(8),
                child: Icon(
                  iconItems[index],
                  size: 25,
                  color: pageIndex == index
                      ? Colors.black
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void setTabs(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
