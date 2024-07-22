import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/getx_controller.dart';
import 'package:student_management_getx/controller/getx_image_controller.dart';
import 'package:student_management_getx/widgets/custom_textfiel.dart';

class AddStudents extends StatelessWidget{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final ItemController itemController = Get.find();
  final ImageController imageController = Get.put(ImageController());
  final _formKey = GlobalKey<FormState>();
  
   AddStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        elevation: 16.0,
        title: const Text(
          "ADD STUDENT",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
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
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: nameController,
                  labelText: 'Enter name',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: ageController,
                  labelText: 'Enter Age',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: phoneController,
                  labelText: 'Enter Phone',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: countryController,
                  labelText: 'Enter Country',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                       itemController.addItem(
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
                      "ADD",
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