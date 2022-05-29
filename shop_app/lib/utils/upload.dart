import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadDownload {
  late UploadTask uploadTask;
  Reference ref = FirebaseStorage.instance.ref().child('products');
  UploadTask uploadImage(String fileName) {
    ref = ref.child("/" + fileName);
    print("File Name " + fileName);
    File file = File(fileName);
    print("File Object is $file");
    uploadTask = ref.putFile(File(fileName)); // Here Upload

    return uploadTask;
  }

  downloadImage() {}
}
