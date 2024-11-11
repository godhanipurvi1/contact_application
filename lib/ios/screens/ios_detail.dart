import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/modelcontect.dart';
import '../../porivider/homeprovider.dart';

class DetailsPage_i extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Contact Details'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.pencil),
          onPressed: () {
            TextEditingController nameController =
                TextEditingController(text: contact.name);
            TextEditingController emailController =
                TextEditingController(text: contact.email);
            TextEditingController phoneController =
                TextEditingController(text: contact.contact);

            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('Edit Contact'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoTextField(
                        controller: nameController,
                        placeholder: 'Name',
                      ),
                      CupertinoTextField(
                        controller: emailController,
                        placeholder: 'Email',
                      ),
                      CupertinoTextField(
                        controller: phoneController,
                        placeholder: 'Phone',
                      ),
                    ],
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        contact.name = nameController.text;
                        contact.email = emailController.text;
                        contact.contact = phoneController.text;

                        String? name = nameController.text;
                        String? email = emailController.text;
                        String? contacts = phoneController.text;

                        Contact updatedContact = Contact(
                          name: name,
                          email: email,
                          contact: contacts,
                        );

                        context
                            .read<ContactsProvider>()
                            .updateContact(updatedContact);

                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${contact.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Email: ${contact.email}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Phone: ${contact.contact}',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      context
                          .read<ContactsProvider>()
                          .launchCaller(contact.contact);
                    },
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.phone),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      context
                          .read<ContactsProvider>()
                          .launchEmail(contact.email);
                    },
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.mail),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
