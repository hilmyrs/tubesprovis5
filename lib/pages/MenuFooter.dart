import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:tubes/pages/RegisterPage.dart';
//import 'package:tubes/pages/LoginPage.dart';
import 'package:tubes/pages/Home.dart';
import 'package:tubes/pages/Marketplace.dart';
import 'CobaWallet.dart';
import 'Account.dart';
import 'myInvest.dart';

class HomePage extends StatefulWidget {
  final String data;
  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 2;
  late String id;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    id = widget.data;
    pages = [
      Marketplace(),
      MyInvest(),
      Home(data: id),
      CobaWallet(
        data: id,
      ),
      Account(data: id),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(99, 255, 255, 255),
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
    BottomNavigationBarThemeData theme = BottomNavigationBarThemeData(
      backgroundColor: Colors.green,
    );

    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(0.5),
      currentIndex: pageIndex,
      onTap: setTabs,
      items: List.generate(iconItems.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(iconItems[index]),
          label: iconLabels[index],
        );
      }),
    );
  }

  void setTabs(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
