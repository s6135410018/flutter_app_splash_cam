// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //ตัวแปรเก็บรูป
  File? selectImage;

  //Method เปิดกล้อง
  Future selectImageFormCamera() async {
    //เปิดกล้องเลือกรูป
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    //ตรวจสอบว่าได้เลือกรูปแล้วหรือยัง ถ้าไม่ได้เลือกก็ยกเลิก
    if (img == null) {
      return;
    }
    //กรณีที่เลือกแล้ว กำหนดค่าให้กับตัวแปรที่สร้างเอาไว้ข้างบน --> selectImage
    //โค้ดนี้มีผลต่อการแสดงผลบนหน้าจอ อยู่ภายใต้คำสั่ง setstate
    setState(() {
      selectImage = File(img.path);
    });
  }

  //Method เปิดแกลอรี่
  Future selectImageFormGallery() async {
    //เปิดกล้องเลือกแกลอรี่
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    }
    setState(() {
      selectImage = File(img.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF85C4),
        title: Text(
          "Splash Cam",
          style: TextStyle(
            color: Colors.purpleAccent[700],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 150.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    150.0,
                  ),
                  child: selectImage == null
                      ? Image.asset(
                          "assets/images/icon.png",
                          fit: BoxFit.cover,
                          width: 200.0,
                          height: 200.0,
                        )
                      : Image.file(
                          File(selectImage!.path),
                          fit: BoxFit.cover,
                          width: 280.0,
                          height: 280.0,
                        ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      selectImageFormCamera();
                    },
                    icon: Icon(
                      FontAwesomeIcons.cameraRetro,
                      color: Colors.indigoAccent[700],
                    ),
                    label: Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff64C5EB),
                      padding: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      elevation: 10.0,
                      shadowColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      selectImageFormGallery();
                    },
                    icon: Icon(
                      Icons.camera,
                      color: Colors.pink,
                    ),
                    label: Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFF9EFF),
                      padding: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      elevation: 10.0,
                      shadowColor: Colors.purpleAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
