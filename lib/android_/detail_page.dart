import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/modelcontect.dart';
import '../porivider/homeprovider.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        //title: Text('Contact Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              TextEditingController nameController =
                  TextEditingController(text: contact.name);
              TextEditingController emailController =
                  TextEditingController(text: contact.email);
              TextEditingController phoneController =
                  TextEditingController(text: contact.contact);

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Edit Contact'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          controller: phoneController,
                          decoration: InputDecoration(labelText: 'Phone'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          contact.name = nameController.text;
                          contact.email = nameController.text;
                          contact.contact = nameController.text;

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

                          // Close the dialog
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
        ],
      ),
      body: Padding(
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
                IconButton(
                  onPressed: () {
                    context
                        .read<ContactsProvider>()
                        .launchCaller(contact.contact);
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ContactsProvider>().launchEmail(contact.email);
                  },
                  icon: Icon(Icons.mail),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
