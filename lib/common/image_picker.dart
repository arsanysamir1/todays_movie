import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';


class MImagePicker {



  XFile? pickedFile = null;
  static File? photo;
  final ImagePicker _picker = ImagePicker();

   Future imgFromGallery() async {

    pickedFile = await _picker.pickImage(source: ImageSource.gallery);


      if (pickedFile != null) {
         UserController.instance.currentUser.value!.setImage(pickedFile!.path);
        photo = File(pickedFile!.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
  }

   void imgFromCamera() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {

         UserController.instance.currentUser.value!.setImage(pickedFile!.path);
        photo = File(pickedFile!.path);
      } else {
        print('No image selected.');
      }
  }

    uploadFile() async {
    try {
      // Reference ref = firebase_storage.FirebaseStorage.instance.ref();
      // Reference reference = ref.child('file/${pickedFile?.name}');
      //  reference.putFile(File(pickedFile!.path));
      // String imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print('error occured');
    }
  }

   Future showPicker(context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}