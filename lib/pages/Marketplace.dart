import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:tubes/pages/Pembayaran.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  String? selectedFilter;
  String? selectedJenisUsaha;
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
  String? selectedLokasi;
  List<String> lokasiOptions = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bengkulu',
    'Lampung',
    'Bangka Belitung',
    'Kepulauan Riau',
    'DKI Jakarta',
    'Jawa Barat',
    'Banten',
    'Jawa Tengah',
    'Yogyakarta',
    'Jawa Timur',
    'Bali',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Sulawesi Utara',
    'Sulawesi Tengah',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Gorontalo',
    'Sulawesi Barat',
    'Maluku',
    'Maluku Utara',
    'Papua',
    'Papua Barat'
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      builder: (BuildContext context, StateSetter setState) {
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
                                title: Text('Pengalaman'),
                                trailing: DropdownButton<String>(
                                  value: selectedPengalaman,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedPengalaman = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Kurang dari 1 tahun',
                                    '1-3 tahun',
                                    '4-6 tahun',
                                    'Lebih dari 6 tahun'
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
                                title: Text('Lokasi'),
                                trailing: DropdownButton<String>(
                                  value: selectedLokasi,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedLokasi = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Aceh',
                                    'Sumatera Utara',
                                    'Sumatera Barat',
                                    'Riau',
                                    'Jambi',
                                    'Sumatera Selatan',
                                    'Bengkulu',
                                    'Lampung',
                                    'Bangka Belitung',
                                    'Kepulauan Riau',
                                    'DKI Jakarta',
                                    'Jawa Barat',
                                    'Banten',
                                    'Jawa Tengah',
                                    'Yogyakarta',
                                    'Jawa Timur',
                                    'Bali',
                                    'Nusa Tenggara Barat',
                                    'Nusa Tenggara Timur',
                                    'Kalimantan Barat',
                                    'Kalimantan Tengah',
                                    'Kalimantan Selatan',
                                    'Kalimantan Timur',
                                    'Kalimantan Utara',
                                    'Sulawesi Utara',
                                    'Sulawesi Tengah',
                                    'Sulawesi Selatan',
                                    'Sulawesi Tenggara',
                                    'Gorontalo',
                                    'Sulawesi Barat',
                                    'Maluku',
                                    'Maluku Utara',
                                    'Papua',
                                    'Papua Barat'
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
                                title: Text('Tenor'),
                                trailing: DropdownButton<String>(
                                  value: selectedTenor,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedTenor = newValue;
                                    });
                                  },
                                  items: <String>[
                                    '3 bulan',
                                    '6 bulan',
                                    '9 bulan',
                                    '12 bulan',
                                    '18 bulan',
                                    '24 bulan',
                                    '36 bulan'
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
                        onChanged: (value) {
                          // Logika untuk memperbarui kata kunci pencarian
                          // Misalnya, simpan kata kunci pencarian ke dalam variabel
                        },
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
          itemCount:
              10, // Replace itemCount with the total number of items you have
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 5),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 43, 149, 133), // Warna border
                        width: 2, // Ketebalan border
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Mengatur posisi bayangan
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
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '[Pengguna Aplikasi]',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '[Nama Usaha]',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '[Lokasi]',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consecteturdipiscing elit. Curabitur quis velit iaculis sapien hendrerit pellentesque id ac diam. Praesent at enim faucibus, pellentesque elit vel, congue ipsum.',
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
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pembayaran()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 40,
                    right: 40,
                    bottom:
                        20, // Mengubah nilai bottom sesuai dengan posisi yang diinginkan
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 131, 212, 255),
                                Color.fromARGB(255, 132, 238, 192)
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
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'PLAFON',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 55),
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
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rp500.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 70),
                                  Text(
                                    '10%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 70),
                                  Text(
                                    '12 Bulan',
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
                                value: 0.5, // Ubah persentase sesuai kebutuhan
                                backgroundColor: Colors
                                    .grey[200], // Warna latar belakang garis
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(
                                      255, 76, 147, 214), // Warna garis
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '1 hari lagi',
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
        ));
  }
}
