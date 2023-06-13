import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'EditProfile.dart';

class Account extends StatefulWidget {
  final String data;

  Account({required this.data});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late Future<Map<String, dynamic>> investorData;

  Future<Map<String, dynamic>> getUserData(String id) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/get_investor/$id'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to fetch investor data');
    }
  }

  @override
  void initState() {
    super.initState();
    investorData = getUserData(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return FutureBuilder<Map<String, dynamic>>(
      future: investorData,
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person),
                          ),
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
                              'Email'.padRight(25, ' ') +
                                  ': '.padRight(10, ' '),
                              style: TextStyle(),
                            ),
                            Flexible(
                              child: Text(
                                '${investor["data"]["email"]}', // Ganti dengan email yang sesuai
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Password'.padRight(20, ' ') +
                                  ': '.padRight(10, ' '),
                              style: TextStyle(),
                            ),
                            Expanded(
                              child: Text(
                                '********', // Ganti dengan password yang sesuai
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Nama Lengkap'.padRight(20, ' ') +
                                  ': '.padRight(10, ' '),
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
                              'Tanggal Lahir'.padRight(20, ' ') +
                                  ': '.padRight(10, ' '),
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
                              'Alamat'.padRight(20, ' ') +
                                  ': '.padRight(10, ' '),
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
                              'No Handphone'.padRight(20, ' ') +
                                  ': '.padRight(10, ' '),
                              style: TextStyle(),
                            ),
                            Text(
                              '${investor["data"]["phone"]}',
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'KTP'.padRight(33, ' ') + ': '.padRight(10, ' '),
                              style: TextStyle(),
                            ),
                            Text(
                              'uploaded',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Selfie'.padRight(32, ' ') +
                                  ': '.padRight(10, ' '),
                              style: TextStyle(),
                            ),
                            Text(
                              'uploaded',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
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
                        Text(
                          'Dokumen Saya',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Perjanjian Pendanaan',
                              style: TextStyle(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tanda Tangan'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Perjanjian Layanan',
                              style: TextStyle(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tanda Tangan'),
                                ),
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
                        Text(
                          'Akun Bank Saya',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Rekening Bank belum terhubung',
                                style: TextStyle(),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Tambahkan Rekening',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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
