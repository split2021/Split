class Contact {
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilPicture;
  double value;

  Contact({this.username, this.firstName, this.lastName, this.email, this.phoneNumber});

  Contact.fromJson(Map<String, dynamic> data)
      : username = data['username'],
        firstName = data['first_name'],
        lastName = data['last_name'],
        email = data['email'],
        phoneNumber = data['phone'];
}
