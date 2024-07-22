import 'package:flutter/material.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'dart:io';

import 'package:student_management_getx/widgets/custom_container.dart';

class ProfilePage extends StatelessWidget {
  final StdItem item;
  const ProfilePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent[200],
        elevation: 16.0,
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              item.image.isNotEmpty
                  ? Image.file(
                      File(item.image),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: CircleAvatar(
                        radius: 80,
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextContainer(
                      text: 'Name: ${item.name}',
                    ),
                    const SizedBox(height: 10),
                    CustomTextContainer(
                      text: 'Age: ${item.age}',
                    ),
                    const SizedBox(height: 10),
                    CustomTextContainer(
                      text: 'Phone: ${item.phoneNumber}',
                    ),
                    const SizedBox(height: 10),
                    CustomTextContainer(
                      text: 'Country: ${item.country}',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
