import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StdItem extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String image;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String country;

  StdItem({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.country,
    required this.image
  });

  

}