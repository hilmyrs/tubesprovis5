import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  File? _ktpImage;
  File? _selfieImage;

  Future<void> _getImageFromGallery(String type) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        if (type == 'ktp') {
          _ktpImage = File(pickedImage.path);
        } else if (type == 'selfie') {
          _selfieImage = File(pickedImage.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Informasi Pribadi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true, // Menampilkan panah kembali
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'No Handphone'),
            ),
            SizedBox(
              height: 10,
            ),
            _ktpImage != null
                ? Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      _ktpImage!.path,
                      height: 200,
                    ))
                : const Text('No KTP image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImageFromGallery('ktp'),
              child: const Text('Select KTP Image'),
            ),
            const SizedBox(height: 20),
            _selfieImage != null
                ? Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      _selfieImage!.path,
                      height: 200,
                    ))
                : const Text('No selfie image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImageFromGallery('selfie'),
              child: const Text('Select Selfie Image'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  child: Text('Simpan'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  child: Text('Batal'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
