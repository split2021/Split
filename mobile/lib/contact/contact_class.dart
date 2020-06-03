class Contact {
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilPicture;
  int id;
  double value;
  bool checked = false;

  Contact(
      {this.firstName = "first_name",
      this.lastName = "last_name",
      this.email = "email",
      this.phoneNumber = "phone_number",
      this.profilPicture = "assets/contact_blank.png",
      this.id = 0,
      this.value = 0});

  Contact.fromJson(Map<String, dynamic> data)
      : firstName = data['first_name'],
        lastName = data['last_name'],
        email = data['email'],
        id = data['id'],
        phoneNumber = data['phone'];
}
