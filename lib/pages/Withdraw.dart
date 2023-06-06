import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  int? selectedMethod;
  List<String> pilihanNominal = [
    '500 ribu',
    '1 juta',
    '2 juta',
    '2,5 juta',
    '5 juta',
    'Semua',
  ];
  TextEditingController nominalController = TextEditingController();
  double saldo = 500000; // Contoh saldo

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

  Widget build(BuildContext context) {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(142, 212, 178, 1),
                ),
                width: double.infinity,
                height: 750,
              ),
              //container yg rounded rectangle
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                //margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(142, 212, 178, 1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color:
                        const Color.fromRGBO(142, 220, 179, 1), // Warna border
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
                        const Text(
                          "Rp. X.XXX.XXX",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                    //white space
                    SizedBox(
                      height: 20,
                    ),
                    //form buat withdraw
                    TextFormField(
                      controller: nominalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(247, 247, 247, 1),
                        labelText: 'Mau tarik berapa?',
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(127, 199, 164, 1)),
                            borderRadius: BorderRadius.circular(15)),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        prefixText: 'Rp. ', // Menambahkan "Rp." sebelum label
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
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: pilihanNominal.length,
                          itemBuilder: (BuildContext context, index) {
                            return Card(
                              color: Color.fromRGBO(247, 247, 247, 1),
                              child: Center(child: Text(pilihanNominal[index])),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
