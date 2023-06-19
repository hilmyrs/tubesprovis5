import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes/pages/Home.dart';
import 'package:tubes/pages/Explore.dart';
import 'CobaWallet.dart';
import 'Account.dart';
import 'Peminjaman.dart';

class HomePage2 extends StatefulWidget {
  final String data;
  final String type;
  final String data_dompet;
  const HomePage2(
      {Key? key,
      required this.data,
      required this.type,
      required this.data_dompet})
      : super(key: key);
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int pageIndex = 2;
  late String a;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    a = widget.data;
    pages = [
      Explore(),
      Peminjaman(),
      Home(
        data: widget.data,
        data_dompet: widget.data_dompet,
        type: widget.type,
      ),
      CobaWallet(
        data: widget.data,
        data_dompet: widget.data_dompet,
        type: widget.type,
      ),
      Account(
        data: widget.data,
        type: widget.type,
      ),
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
      CupertinoIcons.list_bullet,
      CupertinoIcons.collections_solid,
      CupertinoIcons.house_alt_fill,
      CupertinoIcons.creditcard_fill,
      CupertinoIcons.person_2_fill,
    ];
    List<String> iconLabels = [
      'Eksplor',
      'Peminjaman',
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
