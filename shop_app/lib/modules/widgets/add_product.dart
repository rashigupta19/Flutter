import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/modules/models/product.dart';
import 'package:shop_app/modules/repository/product_repo.dart';
import 'package:shop_app/modules/widgets/custom_text.dart';
import 'package:shop_app/utils/toast.dart';

import '../../utils/upload.dart';

class AddProduct extends StatelessWidget {
  Function refeshChild;
  AddProduct(this.refeshChild);
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  _addProduct() {
    String name = nameCtrl.text;
    String desc = descCtrl.text;
    double qty = double.parse(qtyCtrl.text);
    Product product = Product.takeProduct(
        name: name, price: priceValue, qty: qty, desc: desc);
    ProductRepository productRepository = ProductRepository();
    Future<DocumentReference> future = productRepository.add(product);
    future
        .then((value) => createToast('Record Added', ctx))
        .catchError((err) => print(err));
  }

  _uploadIt() {
    UploadDownload obj = UploadDownload();
    UploadTask upload = obj.uploadImage(fileName.toString());
    upload.then((TaskSnapshot shot) async {
      String url = await obj.ref.getDownloadURL();
      print("Download URL " + url);
    }).catchError((err) {
      print("Error $err");
    });
  }

  _showCameraOrGallery() {
    return ElevatedButton(
        onPressed: () async {
          await _showCamera();
          refeshChild();
          _uploadIt();
        },
        child: Text('Upload Image'));
  }

  ImagePicker _picker = ImagePicker();
  _showCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    fileName = (photo?.path);
    print("File Name is $fileName");
  }

  String? fileName; // filename might be null

  double priceValue = 0.0;
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    this.ctx = context;
    return Column(
      children: [
        Text(
          'ADD Product',
          style: TextStyle(fontSize: 40),
        ),
        CustomText(label: 'Type Name Here', tc: nameCtrl),
        CustomText(
          label: 'Type Desc Here',
          tc: descCtrl,
          isMultiline: true,
        ),
        Slider(
          value: priceValue,
          onChanged: (currentValue) {
            priceValue = currentValue;
          },
        ),
        // Image Upload
        CustomText(label: 'Type Qty Here', tc: qtyCtrl),
        _showCameraOrGallery(),
        fileName == null
            ? Text('Choose File to Upload')
            : Container(
                height: 100,
                width: 100,
                child: Image.file(File(fileName.toString()))),
        ElevatedButton(
            onPressed: () {
              _addProduct();
            },
            child: Text('Add Product'))
      ],
    );
  }
}
