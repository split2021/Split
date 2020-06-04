import '../contact/contact_class.dart';
import 'dart:math';

class Group {
  String name;
  String image;
  int id;

  List<Contact> contactList = new List<Contact>();

  Group(String groupName, List<Contact> contactlistIn, int id) {
    // Formula to choose randomly the image linked to the group
    final _random = new Random().nextInt(5);
    //
    this.image = "assets/food_4k_" + (_random + 1).toString() + ".jpg";
    this.name = groupName;
    this.id = id;
    this.contactList = contactlistIn;
  }
}