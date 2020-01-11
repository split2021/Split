import '../contact/contact_class.dart';
import 'dart:math';

class Group {
  String name;
  String image;
  String id;

  List<Contact> contactList;

  Group() {
    // Formula to choose randomly the image linked to the group
    final _random = new Random().nextInt(5);
    //

    this.name = "Group's name";
    this.image = "mobile/assets/food_4k_" + (_random + 1).toString() + ".jpg";

    this.contactList = new List<Contact>();
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
    this.contactList.add(new Contact());
  }
}