import 'package:flutter/material.dart';
import 'package:split/decorations/contact_decorations.dart';

import 'contact_class.dart';

class ContactListTile extends ListTile {
  ContactListTile(Contact contact, BuildContext context)
      : super(
            title: Text(
              "${contact.firstName[0].toUpperCase()}${contact.firstName.substring(1).toLowerCase()}" +
                  " " +
                  contact.lastName.toUpperCase(),
              style: nameTxtStyle,
            ),
            subtitle: Text(
              contact.email,
              style: emailTxtStyle,
            ),
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(contact.firstName[0].toUpperCase() +
                    contact.lastName[0].toUpperCase())));
}
