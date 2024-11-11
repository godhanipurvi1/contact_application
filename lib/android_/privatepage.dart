import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../porivider/homeprovider.dart';

class PrivatePage extends StatefulWidget {
  const PrivatePage({super.key});

  @override
  State<PrivatePage> createState() => _PrivatePageState();
}

class _PrivatePageState extends State<PrivatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: context.watch<ContactsProvider>().privatecontect.length,
        itemBuilder: (context, index) {
          final contact =
              context.read<ContactsProvider>().privatecontect[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(contact.name),
            subtitle: Text(
              'Contact: ${contact.contact}\nEmail: ${contact.email}',
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: contact,
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.lock_open),
              onPressed: () {
                context.read<ContactsProvider>().removefomeprivte(index);
              },
            ),
          );
        },
      ),
    );
  }
}
