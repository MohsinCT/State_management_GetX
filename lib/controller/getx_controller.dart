import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management_getx/model/student_model.dart';

class ItemController extends GetxController {
  var items = <StdItem>[].obs;
  var filteredItems = <StdItem>[].obs;

  late Box<StdItem> itemBox;

  @override
  void onInit() {
    super.onInit();
    itemBox = Hive.box<StdItem>('items');
    items.addAll(itemBox.values.toList());
    filteredItems.addAll(items); // Initialize filteredItems with all items
  }

  void addItem(
      String name, int age, String image, String phoneNumber, String country) {
    final newItem = StdItem(
        name: name,
        age: age,
        phoneNumber: phoneNumber,
        country: country,
        image: image);
    itemBox.add(newItem);
    items.add(newItem);
    items.refresh();
    searchItems(''); // Refresh the filtered list
  }

  void updateItem(int index, String name, int age, String image,
      String phoneNumber, String country) {
    final item = items[index];
    item.name = name;
    item.age = age;
    item.image = image;
    item.country = country;
    item.save();
    items[index] = item;
    items.refresh();
    searchItems(''); // Refresh the filtered list
  }

  void deleteItem(int index) async {
    try {
      await itemBox.deleteAt(index);
      items.removeAt(index);
    } catch (e) {
      // ignore: avoid_print
      print("Error Deleting: $e");
    }
    items.refresh();
    searchItems(''); // Refresh the filtered list
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(items);
    } else {
      filteredItems.assignAll(
        items.where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.phoneNumber.toLowerCase().contains(query.toLowerCase()) ||
            item.country.toLowerCase().contains(query.toLowerCase()))
      );
    }
    filteredItems.refresh();
  }
}
