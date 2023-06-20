import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class ModalUsaha {
  final String imageUrl;
  final String nama;
  final String pemilik;
  final String totalPendanaan;
  final String bagiHasil;
  final String status;
  final String lokasi;
  final String lamaTenor;
  final String deskripsi;

  ModalUsaha({
    required this.imageUrl,
    required this.nama,
    required this.pemilik,
    required this.totalPendanaan,
    required this.bagiHasil,
    required this.status,
    required this.lokasi,
    required this.lamaTenor,
    required this.deskripsi,
  });
}

class CeritaSukses {
  final String nama;
  final String namaUsaha;
  final String cerita;

  CeritaSukses({
    required this.nama,
    required this.namaUsaha,
    required this.cerita,
  });
}

class _ExploreState extends State<Explore> {
  List<ModalUsaha> modalUsahaList = [
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Bubur Bu Kurnia",
      pemilik: "Ibu Kurnia",
      totalPendanaan: "Rp 2.500.000",
      bagiHasil: "12%",
      status: "Sedang Berlangsung",
      lokasi: "Jawa Barat",
      lamaTenor: "10 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
  ];

  List<CeritaSukses> ceritaSuksesList = [
    CeritaSukses(
      nama: "Bapak Slamet",
      namaUsaha: "Warung Makan Sederhana",
      cerita:
          "Warung Makan Sederhana milik Bapak Slamet telah berhasil mengalami pertumbuhan yang pesat setelah mendapatkan pendanaan dari investor. Dengan total pendanaan sebesar Rp 50.000.000, Bapak Slamet mampu melakukan perluasan usaha dengan membuka cabang di beberapa lokasi strategis di Jakarta.",
    ),
    CeritaSukses(
      nama: "Bapak Mantap",
      namaUsaha: "Kedai Kopi Mantap",
      cerita:
          "Setelah meminjam dana dari investor, Kedai Kopi Mantap mampu melakukan ekspansi usaha dengan membuka cabang baru di pusat perbelanjaan yang ramai. Modal yang diperoleh dari investor digunakan untuk membeli peralatan kopi yang lebih modern, meningkatkan kapasitas produksi, dan melatih karyawan dalam pelayanan pelanggan. ",
    ),
    CeritaSukses(
      nama: "Ibu Cantik",
      namaUsaha: "Butik Cantik",
      cerita:
          "Butik Cantik berhasil memperluas jangkauan pasar dengan membuka toko online dan mengembangkan strategi pemasaran digital. Modal yang diperoleh digunakan untuk mengembangkan situs web e-commerce yang menarik, memperluas koleksi produk, dan meningkatkan promosi melalui media sosial. ",
    ),
    CeritaSukses(
      nama: "Ibu Hana",
      namaUsaha: "Warung Makan Rasa Nusantara",
      cerita:
          "Dengan bantuan dana investasi, Warung Makan Rasa Nusantara mampu mengembangkan warung mereka menjadi restoran dengan konsep makanan tradisional modern. Modal tersebut digunakan untuk memperbarui tampilan interior restoran, meningkatkan kualitas dan variasi menu",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Color.fromRGBO(142, 220, 179, 1),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Color.fromRGBO(142, 220, 179, 1), // Warna border
                  width: 1, // Ketebalan border
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.2), // Warna bayangan (black) dengan opasitas 0.2
                    spreadRadius: 2, // Jarak penyebaran bayangan
                    blurRadius: 4, // Jarak blur bayangan
                    offset: Offset(
                        0, 2), // Posisi offset bayangan (horizontal, vertical)
                  ),
                ],
              ),
              width: double.infinity,
              //height: 800,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ayo Dengar Cerita Sukses Mereka!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ceritaSuksesList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 350,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ceritaSuksesList[index].nama,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Usaha " +
                                          ceritaSuksesList[index].namaUsaha,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      ceritaSuksesList[index].cerita,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Para Pemilik Usaha Lainnya",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          shrinkWrap: true,
                          itemCount: modalUsahaList.length,
                          itemBuilder: (context, index) {
                            ModalUsaha modalUsaha = modalUsahaList[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         DetailPortofolio2(
                                //             modalUsaha: modalUsaha),
                                //   ),
                                // );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // mengatur posisi bayangan (x, y)
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                modalUsaha.imageUrl),
                                          ),
                                          Flexible(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Usaha " + modalUsaha.nama,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Text(
                                                    modalUsaha.pemilik,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                      Text(
                                                        modalUsaha.lokasi,
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Bagi Hasil : " +
                                                        modalUsaha.bagiHasil,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
