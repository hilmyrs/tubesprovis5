import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Marketplace.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:tubes/pages/MenuFooter.dart';

class Pembayaran extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;
  final ModalUsaha modalUsaha;

  Pembayaran(
      {required this.data,
      required this.type,
      required this.data_dompet,
      required this.modalUsaha});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  late Future<Map<String, dynamic>> userData;
  late Future<Map<String, dynamic>> peminjamData;

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
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    refreshUserData();
  }

  void refreshUserData() {
    setState(() {
      userData = getUserData(widget.data, widget.type);
      peminjamData =
          getUserData(widget.modalUsaha.id_peminjam.toString(), "peminjam");
    });
  }

  Future<void> updateSaldo(int id, int saldo) async {
    var url = Uri.parse('http://127.0.0.1:8000/update_saldo/');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({"id_dompet": id, "update_saldo": saldo});

    var response = await http.put(url, headers: headers, body: body);
  }

  Future<void> tambahPendanaan(
      int id, int id_investor, int jml_pendanaan, int total_profit) async {
    var url = Uri.parse('http://127.0.0.1:8000/tambah_pendanaan/');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "id_pinjaman": id,
      "id_investor": id_investor,
      "jumlah": jml_pendanaan,
      "keuntungan": total_profit,
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print("Pendanaan Bertambah");
    }
  }

  Future<void> tambahAngsuran(
    int id_pinjaman,
    int id_status,
    String jatuh_tempo,
    String tanggal_pembayaran,
    int jml_angsuran,
    int jml_bagi_hasil,
  ) async {
    var url = Uri.parse('http://127.0.0.1:8000/tambah_angsuran/');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "id_pinjaman": id_pinjaman,
      "id_status": id_status,
      "jatuh_tempo": jatuh_tempo,
      "tanggal_pembayaran": tanggal_pembayaran,
      "jml_angsuran": jml_angsuran,
      "jml_bagi_hasil": jml_bagi_hasil,
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print("Angsuran Bertambah");
    }
  }

  Future<void> addTransaction(
      int id_jenis,
      int id_dompet,
      int saldo,
      String nama,
      int jml_transaksi,
      String tanggal,
      String keterangan,
      int id_bayar) async {
    var url = Uri.parse('http://127.0.0.1:8000/add_transaction');
    var data = {
      "id_jenis": id_jenis,
      "id_dompet": id_dompet.toString(),
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

    if (response.statusCode == 200) {
      if (id_bayar == 1 && id_jenis == 1) {
        updateSaldo(id_dompet, saldo - jml_transaksi);
        tambahPendanaan(
          widget.modalUsaha.id_pinjaman,
          int.parse(widget.data),
          jml_transaksi,
          ((jml_transaksi / widget.modalUsaha.bagiHasil)).toInt(),
        );
      } else if (id_bayar == 1 && id_jenis == 2) {
        updateSaldo(id_dompet, saldo + jml_transaksi);
        Duration month = Duration(days: 30);
        DateFormat dateFormat = DateFormat('yyyy-MM-dd');
        DateTime dateTime = dateFormat.parse(tanggal);
        DateTime jatuhTempo = dateTime.add(month);
        String strJatuhTempo = DateFormat('yyyy-MM-dd').format(jatuhTempo);
        int bagi_hasil = ((jml_transaksi / widget.modalUsaha.bagiHasil) /
                widget.modalUsaha.lamaTenor)
            .toInt();
        int total =
            (((jml_transaksi / widget.modalUsaha.bagiHasil) + jml_transaksi) /
                    widget.modalUsaha.lamaTenor)
                .toInt();
        tambahAngsuran(widget.modalUsaha.id_pinjaman, 1, strJatuhTempo, "",
            total, bagi_hasil);
      }
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
      print('Failed to update data. Error code: ${response.statusCode}');
    }
  }

  String? selectedMethod;
  List<String> pilihanPembayaran = [
    'Saldo',
    'Debit',
    'Kredit',
    'E-Wallet',
    'Qris',
  ];
  TextEditingController nominalController = TextEditingController();

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
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
            final user = snapshot.data;
            return FutureBuilder<Map<String, dynamic>>(
              future: peminjamData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final peminjam = snapshot.data;
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
                              prefixText:
                                  'Rp. ', // Menambahkan "Rp." sebelum label
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
                                      Text('Rp ' +
                                          numberFormat
                                              .format(user!["data"]["saldo"])),
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
                              DateTime currentDate = DateTime.now();
                              String now =
                                  DateFormat('yyyy-MM-dd').format(currentDate);
                              int id = 0;
                              if (metodePembayaran == 'Saldo') {
                                id = 1;
                              }
                              addTransaction(
                                  1,
                                  int.parse(widget.data_dompet),
                                  user!["data"]["saldo"],
                                  "Pendanaan Pinjaman",
                                  int.parse(nominal),
                                  now,
                                  ("Pendanaan " + widget.modalUsaha.nama),
                                  id);
                              addTransaction(
                                  2,
                                  peminjam!["data"]["id_dompet"],
                                  peminjam["data"]["saldo"],
                                  "Menerima Pendanaan",
                                  int.parse(nominal),
                                  now,
                                  ("Masuk Kedalam Saldo"),
                                  1);

                              // Lakukan sesuatu dengan metode pembayaran dan nominal yang dipilih
                            },
                            child: Text('Bayar'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
          ;
        });
  }
}
