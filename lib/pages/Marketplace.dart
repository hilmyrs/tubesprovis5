import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:tubes/pages/Pembayaran.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Marketplace extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  Marketplace(
      {required this.data, required this.type, required this.data_dompet});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class ModalUsaha {
  // Jumlah dana yang terkumpul
  final String imageUrl;
  final int id_peminjam;
  final String nama;
  final String pemilik;
  final int totalPendanaan;
  final int danaTerkumpul;
  final int bagiHasil;
  final String status;
  final String lokasi;
  final int lamaTenor;
  final String deskripsi;
  DateTime targetDate;

  ModalUsaha({
    required this.imageUrl,
    required this.nama,
    required this.id_peminjam,
    required this.pemilik,
    required this.totalPendanaan,
    required this.danaTerkumpul,
    required this.bagiHasil,
    required this.status,
    required this.lokasi,
    required this.lamaTenor,
    required this.deskripsi,
    required this.targetDate,
  });
}

class _MarketplaceState extends State<Marketplace> {
  late Future<List<ModalUsaha>> modalUsahaList;

  Future<List<ModalUsaha>> getPeminjaman(String id) async {
    final hasil =
        await http.get(Uri.parse('http://127.0.0.1:8000/get_all_pinjaman'));
    if (hasil.statusCode == 200) {
      final jsonData = jsonDecode(hasil.body);
      print(jsonData['data']);
      List<ModalUsaha> newDataList = [];
      for (var item in jsonData['data']) {
        // Membuat objek ModalUsaha dari item JSON
        ModalUsaha modalUsaha = ModalUsaha(
          imageUrl:
              "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          nama: item['nama_pinjaman'],
          id_peminjam: item['id_peminjam'],
          pemilik: item['nama_peminjam'],
          totalPendanaan: item['jumlah'],
          bagiHasil: item['bagi_hasil'],
          status: item['status_pinjaman'],
          lokasi: item['lokasi'],
          lamaTenor: item['lama_tenor'],
          deskripsi: item['keterangan'],
          danaTerkumpul: item['dana_terkumpul'],
          targetDate: DateTime.parse(item['target_date']),
          // tambahkan atribut lain sesuai dengan struktur JSON
        );
        newDataList.add(modalUsaha);
      }

      return newDataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? selectedFilter;
  String? selectedJenisUsaha;
  TextEditingController searchMarket = TextEditingController();
  List<String> jenisUsahaOptions = [
    'Kuliner',
    'Fashion',
    'Handcraft',
    'Teknologi',
    'Jasa',
    'Kesehatan',
    'Pendidikan',
    'Olahraga',
    'Pariwisata',
    'Transportasi',
    'Lainnya'
  ];
  String? selectedPengalaman;
  List<String> pengalamanOptions = [
    'Kurang dari 1 tahun',
    '1-3 tahun',
    '4-6 tahun',
    'Lebih dari 6 tahun'
  ];
  String? selectedTenor;
  List<String> tenorOptions = [
    '3 bulan',
    '6 bulan',
    '9 bulan',
    '12 bulan',
    '18 bulan',
    '24 bulan',
    '36 bulan',
  ];
  String? selectedPlafon;
  List<String> plafonOptions = [
    'Rp 10.000.000 >',
    'Rp 10.000.000',
    'Rp 20.000.000',
    'Rp 50.000.000',
    'Rp 100.000.000',
    'Rp 200.000.000',
    'Rp 500.000.000',
    'Rp 1.000.000.000',
    'Rp 1.000.000.000 <'
  ];

  String getProgressPercentage(int danaTerkumpul, int targetPendanaan) {
    // Buat persentase proses line
    double progressPercentage = danaTerkumpul / targetPendanaan;
    int percentage = (progressPercentage * 100).round();

    return '$percentage%';
  }

  String getRemainingDays(DateTime targetDate) {
    // Sisa hari
    DateTime currentDate = DateTime.now();
    int remainingDays = targetDate.difference(currentDate).inDays;

    if (remainingDays > 1) {
      return '$remainingDays hari lagi';
    } else if (remainingDays == 1) {
      return '1 hari lagi';
    } else {
      return 'Hari ini';
    }
  }

  @override
  void initState() {
    super.initState();
    modalUsahaList = getPeminjaman(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return FutureBuilder<List<ModalUsaha>>(
        future: modalUsahaList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final listPeminjaman = snapshot.data!;
            return Scaffold(
              backgroundColor: Color.fromRGBO(142, 212, 178, 1),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 64, 197, 177),
                title: Text(
                  'Marketplace',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    iconSize: 30,
                    onPressed: () {
                      // Logika aksi ketika tombol filter ditekan
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          List<String> selectedFilters =
                              []; // List untuk menyimpan filter yang dipilih

                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                height: 450,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        'Filter',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Jenis Usaha'),
                                      trailing: DropdownButton<String>(
                                        value: selectedJenisUsaha,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedJenisUsaha = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Kuliner',
                                          'Fashion',
                                          'Handcraft',
                                          'Teknologi',
                                          'Jasa',
                                          'Kesehatan',
                                          'Pendidikan',
                                          'Olahraga',
                                          'Pariwisata',
                                          'Transportasi',
                                          'Lainnya'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Plafon'),
                                      trailing: DropdownButton<String>(
                                        value: selectedPlafon,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedPlafon = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Rp 10.000.000 >',
                                          'Rp 10.000.000',
                                          'Rp 20.000.000',
                                          'Rp 50.000.000',
                                          'Rp 100.000.000',
                                          'Rp 200.000.000',
                                          'Rp 500.000.000',
                                          'Rp 1.000.000.000',
                                          'Rp 1.000.000.000 <'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Logika aksi ketika tombol "Terapkan Filter" ditekan
                                          // Misalnya, menerapkan filter pada daftar produk
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Terapkan Filter'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search_rounded),
                    iconSize: 35,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Pencarian'),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: 'Masukkan kata kunci',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Batal'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                child: Text('Cari'),
                                onPressed: () {
                                  // Logika untuk menangani pencarian
                                  // Misalnya, melakukan pencarian dengan kata kunci yang diinputkan
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: listPeminjaman
                    .length, // Replace itemCount with the total number of items you have
                itemBuilder: (BuildContext context, int index) {
                  ModalUsaha modalUsaha = listPeminjaman[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromARGB(
                                  255, 43, 149, 133), // Warna border
                              width: 2, // Ketebalan border
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // Mengatur posisi bayangan
                              ),
                            ],
                          ),
                          width: double.infinity,
                          height: size.height * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(modalUsaha.imageUrl),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      modalUsaha.nama,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      modalUsaha.pemilik,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      modalUsaha.lokasi,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      height:
                                          130, // Atur sesuai dengan ukuran yang diinginkan
                                      child: SingleChildScrollView(
                                        child: Text(
                                          modalUsaha.deskripsi,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 40,
                          right: 40,
                          bottom:
                              35, // Mengubah nilai bottom sesuai dengan posisi yang diinginkan
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pembayaran(
                                          data: widget.data,
                                          data_dompet: widget.data_dompet,
                                          modalUsaha: modalUsaha,
                                          type: widget.type),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 43,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 131, 212, 255),
                                        Color.fromARGB(255, 132, 238, 192),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Ayo modalin Mitra mulai dari Rp100.000',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      15), // Mengatur jarak antara box "Ayo Modalin Mitra" dengan tampilan berikutnya
                              Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'BAGI HASIL',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 55),
                                        Text(
                                          'TENOR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          modalUsaha.bagiHasil.toString() + "%",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 70),
                                        Text(
                                          modalUsaha.lamaTenor.toString() +
                                              " Bulan",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Crowd Funding',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: (modalUsaha.danaTerkumpul /
                                          modalUsaha
                                              .totalPendanaan), // Ubah persentase sesuai kebutuhan
                                      backgroundColor: Color.fromARGB(
                                          255,
                                          230,
                                          230,
                                          230), // Warna latar belakang garis
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color.fromARGB(
                                            255, 0, 197, 180), // Warna garis
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    getRemainingDays(modalUsaha.targetDate),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
