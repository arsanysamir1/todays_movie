import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


class UserImagePicker extends GetxController {
  // .obs makes the file reactive
  var selectedImagePath = ''.obs;
  var isImageLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  // Pick from Gallery
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80, // 2025 Best Practice: compress before upload
      );

      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        // You can trigger upload automatically here
        // uploadImage(File(pickedFile.path));
      } else {
        Get.snackbar("Cancelled", "No image was selected",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  // Placeholder for Firebase Upload (2025 style)
  Future<void> uploadImage(File file) async {
    isImageLoading.value = true;
    try {
      // Your Firebase logic goes here
      // await storage.ref('path').putFile(file);
    } finally {
      isImageLoading.value = false;
    }
  }
}


class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final controller = Get.put(UserImagePicker());

    return Column(
      children: [
        // 1. Reactive Image Display
        Obx(() {
          return CircleAvatar(
            radius: 60,
            backgroundImage: controller.selectedImagePath.value.isEmpty
                ? const AssetImage('assets/default_user.png') as ImageProvider
                : FileImage(File(controller.selectedImagePath.value)),
          );
        }),

        // 2. Button to trigger Picker
        TextButton.icon(
          onPressed: () => _showPickerOptions(),
          icon: const Icon(Icons.camera_alt),
          label: const Text("Change Photo"),
        ),
      ],
    );
  }

  // 2025 GetX style Bottom Sheet
  void _showPickerOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Get.find<UserImagePicker>().pickImage(ImageSource.gallery);
                Get.back(); // Close bottom sheet
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                Get.find<UserImagePicker>().pickImage(ImageSource.camera);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}