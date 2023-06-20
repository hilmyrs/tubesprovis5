import 'package:flutter/material.dart';
import 'package:tubes/pages/Home.dart';
import 'package:tubes/pages/MenuFooter.dart';
import 'package:tubes/pages/MenuFooter2.dart';
import 'package:tubes/pages/RegisterPage.dart';
import 'package:tubes/pages/LandingPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<void> loginUser(
    String email, String password, BuildContext context) async {
  var url = Uri.parse('http://127.0.0.1:8000/login_investor');
  var data = {
    "email": email,
    "password": password,
  };
  var response = await http.post(
    url,
    body: jsonEncode(data),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    String id = responseData['id'];
    String id_dompet = responseData['id_dompet'];
    // Registrasi berhasil
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Anda telah berhasil Login !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomePage(
                              data: id,
                              data_dompet: id_dompet,
                              type: 'investor',
                            )));
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  } else {
    var url = Uri.parse('http://127.0.0.1:8000/login_borrower');
    var data = {
      "email": email,
      "password": password,
    };
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      String id = responseData['id'];
      String id_dompet = responseData['id_dompet'];
      // Registrasi berhasil
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Anda telah berhasil Login !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomePage2(
                                data: id,
                                data_dompet: id_dompet,
                                type: 'borrower',
                              )));
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal Login !'),
            content: Text('Periksa Kembali Username dan Password anda'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");

  void _loginUser() {
    String email = _email.text;
    String password = _password.text;

    // Panggil fungsi registerUser untuk mengirim permintaan ke API FastAPI

    loginUser(email, password, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      App Bar isinya back button, title dari Login Page
      */
      backgroundColor: Color.fromARGB(99, 255, 255, 255),
      appBar: AppBar(
        //Back Button
        //Leading buat nyimpen di pinggir
        leading: BackButton(
          //on pressed biar ketika dipijit pindah ke landing page alias page awal banget, cuman harusnya data ga kesimpen
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPage(),
                ));
          },
        ),
        title: Center(child: Text('Login')),
        backgroundColor: Color.fromARGB(100, 0, 195, 137),
      ),
      body: SingleChildScrollView(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff67727d)),
                    ),
                    TextField(
                      controller: _email,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor: Colors.black,
                        hintText: "Email",
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff67727d)),
                    ),
                    TextField(
                      obscureText: true,
                      controller: _password,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        prefixIconColor: Colors.black,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        suffixIconColor: Colors.black,
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _loginUser();
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 15, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    ));
  }
}
