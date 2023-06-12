import 'package:flutter/material.dart';
import 'EditProfile.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
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
                      'Halo Investor',
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Email'.padRight(25, ' ') + ': '.padRight(10, ' '),
                        style: TextStyle(),
                      ),
                      Flexible(
                        child: Text(
                          'email@example.com', // Ganti dengan email yang sesuai
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Password'.padRight(20, ' ') + ': '.padRight(10, ' '),
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
                          '[Nama Lengkap]',
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
                        '+62xxxxxxxxxx',
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
                            fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Selfie'.padRight(32, ' ') + ': '.padRight(10, ' '),
                        style: TextStyle(),
                      ),
                      Text(
                        'uploaded',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
}
