import '../contact/contact_class.dart';
import '../group/group_class.dart';

class User {
  static String username;
  static String email;
  static String phoneNumber;
  static String firstName;
  static String lastName;
  static String password;
  static String token;
  static int id;
  static List<int> friendsIds;
  static List<int> groupsIds;
  static List<Contact> contactList;
  static List<Group> groupsList;
}