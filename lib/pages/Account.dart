import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'EditProfile.dart';
import 'package:tubes/pages/LandingPage.dart';

class Account extends StatefulWidget {
  final String data;
  final String type;

  Account({required this.data, required this.type});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late Future<Map<String, dynamic>> userData;

  Future<Map<String, dynamic>> getUserData(String id, String type) async {
    if (type == 'investor') {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_investor/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to fetch investor data');
      }
    } else {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_borrower/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("borrower");
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    userData = getUserData(widget.data, widget.type);
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return FutureBuilder<Map<String, dynamic>>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final investor = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    color: Color.fromARGB(
                        255, 235, 232, 232), // Ganti warna sesuai kebutuhan
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Halo ${investor!["data"]["name"]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Color.fromARGB(255, 235, 232, 232),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Akun',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Email'.padRight(25, ' ') + ': ',
                              style: TextStyle(),
                            ),
                            Flexible(
                              child: Text(
                                '${investor["data"]["email"]}', // Ganti dengan email yang sesuai
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Color.fromARGB(255, 235, 232, 232),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Informasi Pribadi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Nama Lengkap  : ',
                              style: TextStyle(),
                            ),
                            Flexible(
                              child: Text(
                                '${investor["data"]["name"]}',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Tanggal Lahir     : ',
                              style: TextStyle(),
                            ),
                            Flexible(
                              child: Text(
                                '${investor["data"]["tanggal_lahir"]}',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Alamat                 : ',
                              style: TextStyle(),
                            ),
                            Flexible(
                              child: Text(
                                '${investor["data"]["alamat"]}',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'No Handphone  : ',
                              style: TextStyle(),
                            ),
                            Text(
                              '${investor["data"]["phone"]}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Color.fromARGB(255, 235, 232, 232),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LandingPage()));
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
