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

class _ExploreState extends State<Explore> {
  List<ModalUsaha> modalUsahaList = [
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Bubur Bu Kurniaaaaaaaaaaaaaaaaaaaaaaa",
      pemilik: "Ibu Kurnia",
      totalPendanaan: "Rp 2.500.000",
      bagiHasil: "12%",
      status: "Sedang Berlangsung",
      lokasi: "Jawa Barat",
      lamaTenor: "10 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Warung Pak Kardio",
      pemilik: "Bapak Kardio",
      totalPendanaan: "Rp 1.000.000",
      bagiHasil: "10%",
      status: "Selesai",
      lokasi: "Kalimantan Barat",
      lamaTenor: "5 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Petani Bu Asih",
      pemilik: "Ibu Asih",
      totalPendanaan: "Rp 1.500.000",
      bagiHasil: "8%",
      status: "Sedang Berlangsung",
      lokasi: "Bali",
      lamaTenor: "12 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Amida",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
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
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
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
                          offset: Offset(0,
                              2), // Posisi offset bayangan (horizontal, vertical)
                        ),
                      ],
                    ),
                    width: double.infinity,
                    //height: 800,
                  ),
                ),
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          margin: EdgeInsets.only(top: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color.fromRGBO(
                                    175, 175, 175, 1), // Warna border
                                width: 0.5, // Ketebalan border
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 2.0, offset: Offset(0, 5))
                              ]
                              // Menggunakan BoxConstraints untuk mengubah lebar
                              ),
                          constraints:
                              BoxConstraints(maxWidth: 800), // Lebar maksimum
                          width: 340,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating Anda Saat Ini',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Ayo Dengar Cerita Sukses Mereka",
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
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Card(
                                child: Row(
                                  children: [
                                    Container(
                                      //margin: EdgeInsets.only(right: 15),
                                      width: 350,
                                      height: 205,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                                          ),
                                        ),
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
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
                                                    backgroundImage:
                                                        NetworkImage(modalUsaha
                                                            .imageUrl),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Usaha " +
                                                                modalUsaha.nama,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            modalUsaha.pemilik,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on_outlined,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              Text(
                                                                modalUsaha
                                                                    .lokasi,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            "Bagi Hasil : " +
                                                                modalUsaha
                                                                    .bagiHasil,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
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
                                      ));
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
