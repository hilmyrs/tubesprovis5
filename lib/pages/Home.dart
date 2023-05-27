import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, top: 30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Selamat Datang [Investor]',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(142, 212, 178, 1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color.fromRGBO(142, 220, 179, 1), // Warna border
                      width: 1, // Ketebalan border
                    ),
                  ),
                  width: double.infinity,
                  height: 800,
                  child: Column(
                    children: [Text('Halo')],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 150),
                  margin: EdgeInsets.only(top: 250),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(142, 212, 178, 1),
                  ),
                  width: double.infinity,
                  height: 800,
                  child: Column(
                    children: [Text('Halo')],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    margin: EdgeInsets.only(top: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.black, // Warna border
                        width: 1, // Ketebalan border
                      ),
                      // Menggunakan BoxConstraints untuk mengubah lebar
                    ),
                    constraints:
                        BoxConstraints(maxWidth: 1000), // Lebar maksimum
                    width: 300,
                    height: 200,

                    child: Column(
                      children: [
                        Text('Tes'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
