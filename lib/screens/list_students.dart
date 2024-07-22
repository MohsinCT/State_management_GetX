import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/getx_controller.dart';
import 'package:student_management_getx/screens/add_students.dart';
import 'package:student_management_getx/screens/edit_student.dart';
import 'package:student_management_getx/screens/profile_student.dart';

// ignore: must_be_immutable
class StudentsList extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  final ItemController itemController = Get.put(ItemController());

  StudentsList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SM-GetX',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                focusColor: Colors.white,
                fillColor: const Color.fromARGB(24, 0, 0, 0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                itemController.searchItems(value);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(transition: Transition.fadeIn, () => AddStudents());
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            final items = itemController.filteredItems;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    color:const  Color.fromARGB(255, 209, 138, 138),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProfilePage(item: item));
                        },
                        leading: item.image.isNotEmpty
                            ? CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 25,
                                child: ClipOval(
                                  child: Image.file(
                                    File(item.image),
                                    fit: BoxFit.fill,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                              )
                            : const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 241, 241),
                                radius: 25,
                                child: Icon(Icons.person)),
                        title: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          item.country,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 233, 217, 217)),
                        ),
                        trailing:  Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              Get.to(() => EditStudent(index: index, item: item));

                            }, icon:const  Icon(Icons.edit,color: Colors.white,)),
                             IconButton(onPressed: () {
                              Get.dialog(
                                AlertDialog(
                                  title:const Text('Delete'),
                                  content:const  Text('Are you sure want do delete??'),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child:const Text('Cancel'),
                                    ),
                                  const SizedBox(width: 10,),
                                     InkWell(
                                      onTap: () {
                                        itemController.deleteItem(index);
                                        Get.back();
                                      },
                                      child:const Text('Delete',style: TextStyle(color: Colors.red),),
                                    ),
                                  ],
                                )
                              );

                            }, icon:const  Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }))
        ],
      ),
    );
  }
}
