import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  String? selectedMethod;
  List<String> pilihanPembayaran = [
    'Saldo',
    'Debit',
    'Kredit',
    'E-Wallet',
    'Qris',
  ];
  TextEditingController nominalController = TextEditingController();
  double saldo = 500000; // Contoh saldo

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 197, 177),
        centerTitle: true,
        title: Text(
          'Pembayaran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Mau mendanai berapa?',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
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
            DropdownButtonFormField<String>(
              value: selectedMethod,
              onChanged: (newValue) {
                setState(() {
                  selectedMethod = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
              items: pilihanPembayaran.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Row(
                    children: [
                      Text(method),
                      if (method == 'Saldo') ...[
                        SizedBox(width: 10),
                        Text('(Rp. $saldo)'),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi yang ingin dilakukan saat tombol ditekan
                String metodePembayaran = selectedMethod ?? '';
                String nominal = nominalController.text;
                // Lakukan sesuatu dengan metode pembayaran dan nominal yang dipilih
              },
              child: Text('Bayar'),
            ),
          ],
        ),
      ),
    );
  }
}
