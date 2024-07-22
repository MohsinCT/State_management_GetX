import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/screens/list_students.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StdItemAdapter());
  await Hive.openBox<StdItem>('items');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:StudentsList(),
     );
  }
   
}