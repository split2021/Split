class Contact {
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilPicture;
  double value;

  Contact(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profilPicture = "assets/contact_blank.png"});

  Contact.fromJson(Map<String, dynamic> data)
      : firstName = data['first_name'],
        lastName = data['last_name'],
        email = data['email'],
        phoneNumber = data['phone'];
}
