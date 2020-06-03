import 'package:flutter/material.dart';

import 'contact_class.dart';

class ContactListTile extends ListTile {
  ContactListTile(Contact contact)
      : super(
            title: Text(contact.firstName + " " + contact.lastName),
            subtitle: Text(contact.phoneNumber),
            leading: CircleAvatar(
                child: Text(contact.firstName[0].toUpperCase() + contact.lastName[0].toUpperCase())));
}