import 'package:http/http.dart';
import 'package:split/group/group_class.dart';
import 'dart:convert';

import '../user/user_class.dart';
import '../user/user_inputs_class.dart';
import '../contact/contact_class.dart';
import '../group/group_class.dart';

// URL Prod : 52.178.136.18:443
// URL Preprod : 40.112.78.121:80
// URL Local : 127.0.0.1:8080

// Password Prod : X#9q@XCy7qy&
// Password Preprod : @4g%G4HB&xE7z

class Requests {
  static String urlRequest = "40.112.78.121:80";
  static Future<String> getAdminToken() async {
    String url = 'http://' + urlRequest + '/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "split_2021@labeip.epitech.eu", "password": "@4g%G4HB&xE7z"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    var parsedJson = jsonDecode(body);
    var adminToken = parsedJson["data"]["token"];
    // Debug
    print("Get admin token request: " + statusCode.toString());

    if (statusCode == 200)
      return adminToken;
    else
      return null;
  }

  static Future<bool> logIn(String username, String password) async {
    String url = 'http://' + urlRequest + '/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "' + username + '", "password": "' + password + '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    // Debug
    print("Log in request: " + statusCode.toString());

    User.friendsIds = new List<int>();
    User.groupsIds = new List<int>();
    if (statusCode == 200) {
      var parsedJson = jsonDecode(body);
      User.username = username;
      User.password = password;
      User.token = parsedJson["data"]["token"];
      User.email = parsedJson["data"]["user"]["email"];
      User.firstName = parsedJson["data"]["user"]["first_name"];
      User.lastName = parsedJson["data"]["user"]["last_name"];
      User.phoneNumber = parsedJson["data"]["user"]["phone"];
      User.id = parsedJson["data"]["user"]["id"];
      for (var friendId in parsedJson["data"]["user"]["friends"] ?? []) {
        User.friendsIds.add(friendId["id"]);
      }
      for (var groupId in parsedJson["data"]["user"]["payment_groups"] ?? [])
        User.groupsIds.add(groupId["id"]);
      return true;
    } else
      return false;
  }

  static Future<bool> createUser() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + urlRequest + '/api/users/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    String json = '{"email": "' +
        UserInputs.email +
        '",	"password": "' +
        UserInputs.password +
        '",	"username": "' +
        UserInputs.username +
        '",	"first_name": "' +
        UserInputs.firstName +
        '",	"last_name": "' +
        UserInputs.lastName +
        '",	"phone": "' +
        UserInputs.phoneNumber +
        '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    // Debug
    print("Create user body request: " + statusCode.toString());

    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<List<Contact>> getContactList() async {
    List<Contact> listContact = [];
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    String url = 'http://' + urlRequest + '/api/users/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    int statusCode = response.statusCode;
    // Debug
    print("Get contact list body request: " + statusCode.toString());
    var parsedJson = jsonDecode(body);
    for (var contact in parsedJson["data"]) {
      listContact.add(Contact.fromJson(contact));
    }
    return listContact;
  }

 static Future<Contact> getUserInfoById(int id) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    Contact fetchedContact;
    String url = 'http://' + urlRequest + '/api/users/' + id.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    var parsedJson = jsonDecode(body);
    fetchedContact = parsedJson;
    return fetchedContact;
  }

  static Future<List<Group>> getGroups(List<int> groupsId) async {
    List<Group> fetchedGroups = [];
    List<Contact> fetchedContact = [];
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    for (var id in groupsId) {
      String url = 'http://' + urlRequest + '/api/groups/' + id.toString();
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": adminToken
      };
      Response response = await get(url, headers: headers);
      String body = response.body;
      int statusCode = response.statusCode;
      // Debug
      print("Get group ID: " +
          id.toString() +
          " request: " +
          statusCode.toString());
      var parsedJson = jsonDecode(body);
      fetchedGroups.add(new Group(parsedJson["data"]["name"]));
    }
    return fetchedGroups;
  }

  static Future<String> getUserFullname() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return "null";
    String url = 'http://' + urlRequest + '/api/users/32';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    var parsedBody = jsonDecode(body);
    return parsedBody["data"]["first_name"] +
        " " +
        parsedBody["data"]["last_name"];
  }

  static Future<bool> editUserProfile() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + urlRequest + '/api/users/32';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": adminToken
    };
    String json = '{"email": "' +
        User.email +
        '",	"username": "' +
        User.username +
        '",	"first_name": "' +
        User.firstName +
        '",	"last_name": "' +
        User.lastName +
        '",	"phone": "' +
        User.phoneNumber +
        '"}';
    Response response = await patch(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    print("Edit User Profile request " + body);

    if (statusCode == 200)
      return true;
    else
      return false;
  }
}
