// import 'dart:html';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:painting_app/controller/painting_firestore_controller.dart';
import 'package:painting_app/models/painting.dart';
import 'package:painting_app/widgets/helper.dart';

class AddPaintingScreen extends StatefulWidget {
  @override
  _AddPaintingScreenState createState() => _AddPaintingScreenState();
}

class _AddPaintingScreenState extends State<AddPaintingScreen> {
  TextEditingController? _productName;
  TextEditingController? _productPrice;
  TextEditingController? _ownerName;
  TextEditingController? _details;
  ImagePicker image = ImagePicker();
  File? file;
  String? urlImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productName = TextEditingController();
    _productPrice = TextEditingController();
    _ownerName = TextEditingController();
    _details = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _productName!.dispose();
    _productPrice!.dispose();
    _ownerName!.dispose();
    _details!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getImage() async {
      var img = await image.pickImage(source: ImageSource.gallery);
      setState(() {
        file = File(img!.path);
      });
    }

    uploadImage() async {
      var imageFile = FirebaseStorage.instance.ref().child('path');
      UploadTask task = imageFile.putFile(file!);
      TaskSnapshot snapshot = await task;
      urlImage = await snapshot.ref.getDownloadURL();
      // HelperS.showMessage(context, url!);
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //PaintingImage
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 700,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  // borderRadius: BorderRadius.circular(180),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: file == null
                          ? AssetImage('')
                          : FileImage(File(file!.path)) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //ProductDetails
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: 375,
                height: 298,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                //Product(Name&Price&Owner)
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 19,
                    right: 25,
                    left: 25,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Name & Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //ProductName
                            Container(
                              width: 200,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                                child: TextField(
                              controller: _productName,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              cursorRadius: Radius.circular(10),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Name...',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            ),
                            //ProductPrice
                            Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                controller: _productPrice,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                cursorRadius: Radius.circular(10),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Price...',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Divider
                        Divider(
                          color: Color(0xAFA8A8A8),
                          thickness: 1,
                        ),
                        //Owner
                        Row(
                          children: [
                            //SizedBox(5)
                            SizedBox(
                              width: 5,
                            ),
                            //OwnerName
                            Container(
                              width: 200,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _ownerName,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                cursorRadius: Radius.circular(10),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'OwnerName...',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Divider
                        Divider(
                          color: Color(0xAFA8A8A8),
                          indent: 70,
                          endIndent: 70,
                          thickness: 1,
                          height: 2,
                        ),
                        //Details
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            controller: _details,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 6,
                            cursorColor: Colors.black,
                            cursorRadius: Radius.circular(10),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Details...',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        //AddPainting
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () async {
                                await uploadImage();
                                await performStore();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xAFFFDFD8),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Add Painting',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xAF47292A),
                                ),
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
            //Close
            Positioned(
              right: 20,
              top: 70,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'Home');
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future performStore() async {
    if (check()) {
      await store();
    }
  }

  bool check() {
    if (_details!.text.isNotEmpty &&
        _ownerName!.text.isNotEmpty &&
        _productName!.text.isNotEmpty &&
        _productPrice!.text.isNotEmpty &&
        urlImage!.isNotEmpty) {
      return true;
    }
    HelperS.showMessage(context, 'Fields are empty...', error: true);
    return false;
  }

  Future store() async {
    bool saved = await PaintingFireStoreController.instance.create(getPainting());
    if (saved) {
      HelperS.showMessage(context, 'Saved successfully');
      clear();
      urlImage = '';
    } else {
      HelperS.showMessage(context, 'Failed to saved', error: true);
    }
  }

  Painting getPainting() {
    return Painting(
      id: '',
      productName: _productName!.text,
      productPrice: _productPrice!.text,
      ownerName: _ownerName!.text,
      details: _details!.text,
      urlImage: urlImage!,
    );
  }

  void clear() {
    _productName!.text = '';
    _productPrice!.text = '';
    _ownerName!.text = '';
    _details!.text = '';
    urlImage = '';
  }
}
