import 'package:http/http.dart';
import 'dart:convert';

import '../user/user_class.dart';
import '../user/user_inputs_class.dart';
import '../contact/contact_class.dart';

class Requests {
  static Future<String> getAdminToken() async {
    String url = 'http://52.178.136.18:443/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "split_2021@labeip.epitech.eu", "password": "X#9q@XCy7qy&"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    var parsedJson = jsonDecode(body);
    var adminToken = parsedJson["data"]["token"];
    // Debug
    print("Get admin token request body " + body);

    if (statusCode == 200)
      return adminToken;
    else
      return null;
  }

  static Future<bool> logIn(String username, String password) async {
    String url = 'http://52.178.136.18:443/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "' + username + '", "password": "' + password + '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    // Debug
    print("Log in request body " + body);

    if (statusCode == 200) {
      var parsedJson = jsonDecode(body);
      User.username = username;
      User.password = password;
      User.token = parsedJson["data"]["token"];
      return true;
    } else
      return false;
  }

  static Future<bool> createUser() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    print("Admin token: " + adminToken);
    String url = 'http://52.178.136.18:443/api/users/';
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
    print("Create user body request " + body);

    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<List<Contact>> getContactList() async {
    List<Contact> listContact = [];
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    print("Admin token: " + adminToken);
    String url = 'http://52.178.136.18:443/api/users/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    // Debug
    print("Get contact list body reqquest " + body);
    var parsedJson = jsonDecode(body);
    for (var contact in parsedJson["data"]) {
      listContact.add(Contact.fromJson(contact));
    }
    return listContact;
  }

  static Future<String> getUserFullname() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return "null";
    print("Admin token: " + adminToken);
    String url = 'http://52.178.136.18:443/api/users/32';
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
    print("Admin token: " + adminToken);
    String url = 'http://52.178.136.18:443/api/users/32';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": adminToken
    };
    print(User.password);
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
