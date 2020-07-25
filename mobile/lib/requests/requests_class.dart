import 'package:http/http.dart';
import 'package:split/group/group_class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../user/user_class.dart';
import '../contact/contact_class.dart';
import '../group/group_class.dart';

// URL Prod : 52.178.136.18:443
// URL Preprod : 40.112.78.121:80
// URL Local : 127.0.0.1:8080

// Password Prod : X#9q@XCy7qy&
// Password Preprod : @4g%G4HB&xE7z

class Requests {
  static String _urlRequest = "40.112.78.121:80";
  static String reasonRequest;
  static String statusCodeRequest;

  static Future<String> getAdminToken() async {
    if (User.token == null ||
        User.adminTokenTimer == null ||
        User.adminTokenTimer.difference(DateTime.now()).inMinutes < -59) {
      String url = 'http://' + _urlRequest + '/api/login';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json =
          '{"email": "split_2021@labeip.epitech.eu", "password": "@4g%G4HB&xE7z"}';
      Response response = await post(url, headers: headers, body: json);
      int statusCode = response.statusCode;
      String body = response.body;
      var parsedJson = jsonDecode(body);
      reasonRequest = parsedJson["reason"];
      statusCodeRequest = parsedJson["statuscode"].toString();
      User.adminToken = parsedJson["data"]["token"];
      // Debug
      print("Get admin token request: " + statusCode.toString());
      User.adminTokenTimer = DateTime.now();
      if (statusCode == 200)
        return User.adminToken;
      else
        return null;
    }
    return User.adminToken;
  }

  static Future<bool> updateUser(String username, String password) async {
    String url = 'http://' + _urlRequest + '/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "' + username + '", "password": "' + password + '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    // Debug
    //print("Data: " + body);
    User.friendsIds = new List<int>();
    User.groupsIds = new List<int>();
    User.contactList = new List<Contact>();
    var parsedJson = jsonDecode(body);
    reasonRequest = response.reasonPhrase;
    statusCodeRequest = response.statusCode.toString();
    if (statusCode == 200) {
      User.username = username;
      User.password = password;
      User.token = parsedJson["data"]["token"];
      User.email = parsedJson["data"]["user"]["email"];
      User.firstName = parsedJson["data"]["user"]["first_name"];
      User.lastName = parsedJson["data"]["user"]["last_name"];
      User.phoneNumber = parsedJson["data"]["user"]["phone"];
      User.id = parsedJson["data"]["user"]["id"];
      User.profilePic = parsedJson["data"]["user"]["icon"];
      for (var friendId in parsedJson["data"]["user"]["friends"] ?? []) {
        User.friendsIds.add(friendId["id"]);
      }
      for (var groupId in parsedJson["data"]["user"]["payment_groups"] ?? [])
        User.groupsIds.add(groupId["id"]);
      for (var id in User.friendsIds)
        Requests.getUserInfoById(id).then((value) {
          User.contactList.add(value);
        });
      return true;
    } else
      return false;
  }

  static Future<bool> createGroup(String groupName) async {
    String adminToken = await getAdminToken();
    List<int> usersIds = new List<int>();
    for (var user in User.contactList) {
      if (user.checked == true) usersIds.add(user.id);
    }
    usersIds.add(User.id);
    if (adminToken == null) return false;
    String url = 'http://' + _urlRequest + '/api/payment_groups/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    String usersIdsToString = usersIds.join(", ");
    String json =
        '{"name": "' + groupName + '", "users": [' + usersIdsToString + ']}';
    print(json);
    Response response = await post(url, headers: headers, body: json);
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    int statusCode = response.statusCode;
    // Debug
    // print("Create group request: " + statusCode.toString());
    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> createUser(String email, String password, String username,
      String firstName, String lastName, String phoneNumber) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + _urlRequest + '/api/users/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    String json = '{"email": "' +
        email +
        '",	"password": "' +
        password +
        '",	"username": "' +
        username +
        '",	"first_name": "' +
        firstName +
        '",	"last_name": "' +
        lastName +
        '",	"phone": "' +
        phoneNumber +
        '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    // Debug
    // print("Create user request: " + statusCode.toString());

    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> postPayment(List<String> userList, List<String> emailList,
      double total, int groupId) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + _urlRequest + '/api/payment';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    String json = '{"group": ' +
        groupId.toString() +
        ',	"users": {' +
        userList.join(", ") +
        '},	"total": ' +
        total.round().toString() +
        ',	"target": "' +
        "sb-uzjfr871438@business.example.com" +
        '"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    var data = parsedJson["data"];
    for (var email in emailList) {
      int i = 0;
      for (var value in data[email]) {
        i++;
        int y = 0;
        if (i == 2)
          for (var link in value) {
            y++;
            if (y == 2) sendEmail(email, link);
          }
      }
    }
    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> sendEmail(String recipient, String body) async {
    Map<String, String> headers = new Map();
    headers["Authorization"] =
        "Bearer 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";
    headers["Content-Type"] = "application/json";

    var url = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(url,
        headers: headers,
        body: '{"personalizations": [{"to": [{"email": "' +
            recipient +
            '"}]}],"from": {"email": "hugomrt.94@gmail.com"},"subject": "Your paypal link","content": [{"type": "text/plain", "value": "' +
            body +
            '"}]}');
    print('Response status: ${response.statusCode}');
    return true;
  }

  static Future<List<Contact>> getContactList() async {
    List<Contact> listContact = [];
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    String url = 'http://' + _urlRequest + '/api/users/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    // Need fix
    // ignore: unused_local_variable
    int statusCode = response.statusCode;
    // Debug
    // print("Get contact list request: " + statusCode.toString());
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    for (var contact in parsedJson["data"]) {
      listContact.add(Contact.fromJson(contact));
    }
    return listContact;
  }

  static Future<bool> deleteGroupById(int id) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    String url =
        'http://' + _urlRequest + '/api/payment_groups/' + id.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await delete(url, headers: headers);
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    // Debug
    // print("Delete group " +
    //    id.toString() +
    //    " request: " +
    //    response.statusCode.toString());
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<Contact> getUserInfoById(int id) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    Contact fetchedContact;
    String url = 'http://' + _urlRequest + '/api/users/' + id.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    fetchedContact = Contact.fromJson(parsedJson["data"]);
    return fetchedContact;
  }

  static Future<List<Group>> getGroups(List<int> groupsId) async {
    List<Group> fetchedGroups = [];
    String adminToken = await getAdminToken();
    if (adminToken == null) return null;
    for (var id in groupsId) {
      String url =
          'http://' + _urlRequest + '/api/payment_groups/' + id.toString();
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": adminToken
      };
      Response response = await get(url, headers: headers);
      String body = response.body;
      // Need fix
      // ignore: unused_local_variable
      int statusCode = response.statusCode;
      // Debug
      // print("Get group ID: " +
      //    id.toString() +
      //    " request: " +
      //    statusCode.toString());
      var parsedJson = jsonDecode(body);
      reasonRequest = parsedJson["reason"];
      statusCodeRequest = parsedJson["statuscode"].toString();
      List<Contact> userIds = new List<Contact>();
      for (var userId in parsedJson["data"]["users"]) {
        Requests.getUserInfoById(userId["id"]).then((value) {
          //print(value.firstName + value.lastName + value.email + value.id.toString() + value.phoneNumber);
          userIds.add(new Contact(
              firstName: value.firstName,
              lastName: value.lastName,
              email: value.email,
              id: value.id,
              phoneNumber: value.phoneNumber));
        });
      }
      fetchedGroups.add(new Group(parsedJson["data"]["name"], userIds, id));
    }
    return fetchedGroups;
  }

  static Future<String> getUserFullname() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return "null";
    String url = 'http://' + _urlRequest + '/api/users/' + User.id.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    Response response = await get(url, headers: headers);
    String body = response.body;
    print("GetUsername BODY" + body);
    var parsedBody = jsonDecode(body);
    return parsedBody["data"]["first_name"] +
        " " +
        parsedBody["data"]["last_name"];
  }

  static Future<bool> addFriends(int id1, int id2) async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + _urlRequest + '/api/friendships/';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": adminToken
    };
    String json = '{"user1_id": "' +
        id1.toString() +
        '",	"user2_id": "' +
        id2.toString() +
        '"}';
    Response response = await post(url, headers: headers, body: json);
    String body = response.body;
    var parsedJson = jsonDecode(body);
    reasonRequest = parsedJson["reason"];
    statusCodeRequest = parsedJson["statuscode"].toString();
    int statusCode = response.statusCode;
    // Debug
    // print("Add friend request: " + statusCode.toString());

    if (statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> editUserProfile() async {
    String adminToken = await getAdminToken();
    if (adminToken == null) return false;
    String url = 'http://' + _urlRequest + '/api/users/' + User.id.toString();
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
