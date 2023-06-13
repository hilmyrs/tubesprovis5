import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class ModalUsaha {
  final String imageUrl;
  final String nama;
  final String pemilik;
  final String status;
  final String deskripsi;
  final String durasiNotif;

  ModalUsaha({
    required this.imageUrl,
    required this.nama,
    required this.pemilik,
    required this.status,
    required this.deskripsi,
    required this.durasiNotif,
  });
}

class _NotifikasiState extends State<Notifikasi> {
  List<ModalUsaha> modalUsahaList = [
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Bubur Bu Kurnia",
      pemilik: "Ibu Kurnia",
      status: "Sedang Berlangsung",
      deskripsi: "Pendanaan akan selesai dalam waktu 3 hari lagi",
      durasiNotif: "Hari ini",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Warung Pak Kardio",
      pemilik: "Bapak Kardio",
      status: "Selesai",
      deskripsi: "Pengusaha gagal membayar, pendanaan dihentikan oleh sistem",
      durasiNotif: "1 jam yang lalu",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Petani Bu Asih",
      pemilik: "Ibu Asih",
      status: "Sedang Berlangsung",
      deskripsi: "Pendanaan telah selesai",
      durasiNotif: "Kemarin",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Kue Cantika",
      pemilik: "Cantika",
      status: "Selesai",
      deskripsi: "Pendanaan telah selesai",
      durasiNotif: "11/06/2023",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Nasi Pada Bu Cici",
      pemilik: "Ibu Asih",
      status: "Selesai",
      deskripsi: "Pendanaan telah selesai",
      durasiNotif: "10/06/2023",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Seblak Bintang",
      pemilik: "Ibu Asih",
      status: "Selesai",
      deskripsi: "Pendanaan telah selesai",
      durasiNotif: "09/06/2023",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Risol Mayo",
      pemilik: "Ibu Asih",
      status: "Selesai",
      deskripsi: "Pendanaan telah selesai",
      durasiNotif: "10/06/2023",
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
                color: Colors.transparent,
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    AppBar(
        centerTitle: true,
        title: const Text(
          'Notifikasi',
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
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    margin: EdgeInsets.only(top: 50),
                    width: double.infinity,
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
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
                                    onTap: () {},
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(255, 110, 110, 110),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(modalUsaha.imageUrl),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Modal Usaha " + modalUsaha.nama,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          modalUsaha.deskripsi,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                        Text(
                                                          modalUsaha.status,
                                                          style: TextStyle(
                                                            color: modalUsaha.status == "Selesai" ? Colors.blue : Colors.green,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Align(
  alignment: Alignment.centerRight,
  child: Text(
    modalUsaha.durasiNotif,
    style: TextStyle(
      color: Colors.black,
      fontSize: 11,
    ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// In the code you provided, to remove the yellow color background, you can update the `Container` widget that wraps the `ListView.builder` with a `Color` property set to `Colors.transparent`. This will make the background of the container transparent, removing the yellow color.

// Here's the updated code:
// ```dart
// Container(
//   color: Colors.transparent,
//   child: ListView.builder(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     shrinkWrap: true,
//     itemCount: modalUsahaList.length,
//     itemBuilder: (context, index) {
//       ModalUsaha modalUsaha = modalUsahaList[index];
//       // Rest of the code...
//     },
//   ),
// ),
