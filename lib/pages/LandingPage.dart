import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/pages/RegisterPage.dart';
import 'package:tubes/pages/LoginPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
//viewport as margin left
  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

//indicator handler
  @override
  void initState() {
    //pagecontroller dibuat selalu listening
    //setiap pageview discrollke samping maka akan mengambil index page
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(99, 255, 255, 255),
      body: SingleChildScrollView(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Image.network(
          'https://i.ibb.co/QpSc5WZ/Yuk-Danain.png',
          height: 200,
          width: 460,
          fit: BoxFit.cover,
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          margin: EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: Color.fromRGBO(142, 212, 178, 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          width: double
              .infinity, // lebar kotak container terbentang dari kiri ke kanan

          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Color(0xff3e4784),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Color(0xff3e4784),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
              ),
              
                 
            ],
          )),
    ]));
  }
}
