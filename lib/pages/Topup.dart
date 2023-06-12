import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Topup extends StatefulWidget {
  const Topup({super.key});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  int? selectedMethod;
  List<String> pilihanNominal = [
    '500 ribu',
    '1 juta',
    '2 juta',
    '2,5 juta',
    '5 juta',
    'Semua',
  ];
  final nominalController = TextEditingController();
  double saldo = 500000; // Contoh saldo

  int selectedRadioIndex = -1;
  List<String> dropdownValues = ['Option 1', 'Option 2'];
  List<String> radioOptions = ['Bank', 'E-Wallet'];
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
          'Topup',
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
                    //form buat Topup
                    TextFormField(
                      controller: nominalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(247, 247, 247, 1),
                        labelText: 'Mau Topup berapa?',
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(127, 199, 164, 1)),
                            borderRadius: BorderRadius.circular(15)),
                        labelStyle: const TextStyle(
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
                                  selectedMethod = index;
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    pilihanNominal[index],
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
                        "Bayar dengan",
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
                              itemBuilder: (BuildContext context, int index) {
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
                                            selectedRadioIndex = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    if (selectedRadioIndex == index)
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                                          value: dropdownValues[index],
                                          onChanged: (newValue) {},
                                          items: dropdownValues.map((value) {
                                            return DropdownMenuItem<String>(
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
                          onTap: () {},
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
}
