import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tubes/pages/MenuFooter2.dart';
import 'package:tubes/pages/MenuFooter.dart';

class Withdraw extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  Withdraw({required this.data, required this.type, required this.data_dompet});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
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

  Future<void> addTransaction(int id_jenis, int id_dompet, String nama,
      int jml_transaksi, String tanggal, String keterangan) async {
    var url = Uri.parse('http://127.0.0.1:8000/add_transaction');
    var data = {
      "id_jenis": id_jenis,
      "id_dompet": id_dompet,
      "nama_transaksi": nama,
      "jml_transaksi": jml_transaksi,
      "tanggal": tanggal,
      "keterangan": keterangan,
    };
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<void> updateSaldo(int id, int saldo, int jml,
      Map<String, dynamic> dataUser, String pembayaran, String dompet) async {
    var url = Uri.parse('http://127.0.0.1:8000/update_saldo/');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({"id_dompet": id, "update_saldo": saldo});

    var response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      DateTime now = DateTime.now();
      String currentDate = DateFormat('yyyy-MM-dd').format(now);
      String keterangan = "";
      if (pembayaran == 'Bank') {
        keterangan = "Transfer ke Bank";
      } else {
        keterangan = "Transfer ke E-Wallet $dompet";
      }
      addTransaction(1, dataUser['data']['id_dompet'], "Tarik Dana", jml,
          currentDate, keterangan);
      if (widget.type == "investor") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Tarik Dana Berhasil Dilakukan !'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomePage(
                                  data: widget.data,
                                  data_dompet: widget.data_dompet,
                                  type: widget.type,
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
              title: Text('Success'),
              content: Text('Tarik Dana Berhasil Dilakukan !'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomePage2(
                                  data: widget.data,
                                  data_dompet: widget.data_dompet,
                                  type: widget.type,
                                )));
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    } else {
      print('Failed to update data. Error code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    userData = getUserData(widget.data, widget.type);
  }

  int? selectedMethod;
  List<int> pilihanNominal = [
    500000,
    1000000,
    1500000,
    2000000,
    5000000,
  ];
  final nominalController = TextEditingController();

  int selectedRadioIndex = -1;
  List<String> ewalletOption = ['Dana', 'Shopeepay', 'Gopay', 'OVO'];
  List<String> radioOptions = ['Bank', 'E-Wallet'];
  String selectedWallet = "";
  String paymentOption = "";

  void setWallet(String val) {
    selectedWallet = val;
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

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
          final user = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Withdraw',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: true, // Menampilkan panah kembali
              iconTheme: const IconThemeData(
                color: Colors.black,
              ), // Mengubah warna panah kembali menjadi hitam
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      margin: const EdgeInsets.only(top: 100),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(142, 212, 178, 1),
                      ),
                      width: double.infinity,
                      height: 750,
                    ),
                    //container yg rounded rectangle
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      //margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(142, 212, 178, 1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color.fromRGBO(
                              142, 220, 179, 1), // Warna border
                          width: 1, // Ketebalan border
                        ),
                      ),
                      width: double.infinity,
                      height: 800,
                      child: Column(
                        children: [
                          //Text Total Saldo
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Total Saldo",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //*********************
                          //
                          // Row Icon Wallet + Total saldo
                          // To Do ganti variabel text
                          //
                          // */
                          Row(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Rp. " +
                                    numberFormat.format(user!["data"]["saldo"]),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          //white space
                          SizedBox(
                            height: 20,
                          ),
                          //form buat Withdraw
                          TextFormField(
                            controller: nominalController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(247, 247, 247, 1),
                              labelText: 'Mau Tarik berapa?',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(127, 199, 164, 1)),
                                  borderRadius: BorderRadius.circular(15)),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              prefixText:
                                  'Rp. ', // Menambahkan "Rp." sebelum label
                              prefixStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          //***
                          //Pilihan Nominal Uang
                          //
                          // */
                          GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2.0,
                              ),
                              itemCount: pilihanNominal.length,
                              itemBuilder: (BuildContext context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: selectedMethod == index
                                          ? Color(0xff3e4784)
                                          : Colors.transparent,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        //if clicked again then selected method = null
                                        if (selectedMethod == index) {
                                          selectedMethod = null;
                                          nominalController.clear();
                                        } else {
                                          selectedMethod = index;

                                          nominalController.text =
                                              pilihanNominal[index].toString();
                                        }
                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Rp. " +
                                              numberFormat
                                                  .format(pilihanNominal[index])
                                                  .toString(),
                                          style: TextStyle(
                                              color: selectedMethod == index
                                                  ? Color(0xff3e4784)
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                );
                              }),

                          //
                          //White space
                          //

                          const SizedBox(height: 20),

                          //****
                          //
                          //Pilih Tarik ke mana (radio option)
                          //
                          // */

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tujuan Withdraw",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),

                          const SizedBox(height: 10),

                          //list view builder
                          Expanded(
                            child: Column(children: [
                              Container(
                                height: 200,
                                child: ListView.builder(
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              radioOptions[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //Radio
                                            leading: Radio(
                                              value: index,
                                              groupValue: selectedRadioIndex,
                                              onChanged: (value) {
                                                setState(() {
                                                  paymentOption =
                                                      radioOptions[value!];
                                                  selectedRadioIndex = value;
                                                  setWallet(
                                                      ewalletOption[index]);
                                                });
                                              },
                                            ),
                                          ),
                                          if (selectedRadioIndex == index &&
                                              index == 1)
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              width: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              //Dropdown
                                              child: DropdownButton<String>(
                                                value: selectedWallet,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    setWallet(newValue!);
                                                  });
                                                },
                                                items:
                                                    ewalletOption.map((value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                        ],
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  updateSaldo(
                                      user["data"]["id_dompet"],
                                      (user["data"]["saldo"] -
                                          int.parse(nominalController.text)),
                                      int.parse(nominalController.text),
                                      user,
                                      paymentOption,
                                      selectedWallet);
                                  print('Container di-tap');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                  decoration: BoxDecoration(
                                      color: Color(0xff3e4784),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text(
                                      "Lanjut",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            ),
          );
        }
      },
    );
  }
}
