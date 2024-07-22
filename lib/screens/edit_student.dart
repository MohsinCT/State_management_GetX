import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/getx_controller.dart';

import 'dart:io';

import 'package:student_management_getx/controller/getx_image_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/widgets/custom_textfiel.dart';

class EditStudent extends StatelessWidget {
  final int index;
  final StdItem item;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final ImageController imageController = Get.put(ImageController());

  EditStudent({super.key, required this.index, required this.item})
      : nameController = TextEditingController(text: item.name),
        ageController = TextEditingController(text: item.age.toString()),
        phoneController = TextEditingController(text: item.phoneNumber),
        countryController = TextEditingController(text: item.country) {
    imageController.selectedImage.value = item.image;
  }

  final ItemController itemController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        elevation: 16.0,
        title: const Center(
          child: Text(
            "EDIT STUDENT",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Obx(() {
                  return Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: imageController
                                    .selectedImage.value.isNotEmpty
                                ? Image.file(
                                    File(imageController
                                        .selectedImage.value),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: const Text("Choose image"),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      imageController.pickImageGallary();
                                      Get.back();
                                    },
                                    child: const Text("Gallery"),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      imageController.pickImageFromCamera();
                                      Get.back();
                                    },
                                    child: const Text("Camera"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: nameController,
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: ageController,
                  labelText: 'Age',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: phoneController,
                  labelText: 'Phone',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: countryController,
                  labelText: 'Place',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      itemController.updateItem(
                        index,
                        nameController.text,
                        int.parse(ageController.text),
                        imageController.selectedImage.value,
                        phoneController.text,
                        countryController.text,
                      );
                      Get.back();
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "EDIT",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
