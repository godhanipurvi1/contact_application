import 'package:app_contect/android_/privatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../porivider/homeprovider.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final contactsProvider = Provider.of<ContactsProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts List'),
//       ),
//       body: ListView.builder(
//           itemCount: contactsProvider.contacts.length,
//           itemBuilder: (context, index) {
//             final contact = contactsProvider.contacts[index];
//             return ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text(contact.name),
//                 subtitle: Text(
//                     'Contact: ${contact.contact}\nEmail: ${contact.email}'),
//                 isThreeLine: true,
//                 onTap: () {
//                   Navigator.pushNamed(context, '/details', arguments: {
//                     'name': contact.name,
//                     'contact': contact.contact,
//                     'email': contact.email,
//                   });
//                 });
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Action for the floating button if needed
//         },
//         tooltip: 'Go to another page',
//         child: Icon(Icons.arrow_forward),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: context.watch<ContactsProvider>().isanroid,
              onChanged: (value) {
                context.read<ContactsProvider>().isplatform();
              }),
          IconButton(
              icon: Icon(Icons.lock),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivatePage()),
                );
              })
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<ContactsProvider>().contacts.length,
        itemBuilder: (context, index) {
          final contact = context.watch<ContactsProvider>().contacts[index];

          return GestureDetector(
            onTap: () {
              context.read<ContactsProvider>().curruntindex;
              Navigator.pushNamed(context, '/details',
                  arguments: context.read<ContactsProvider>().contacts[index]);
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(contact.name),
              // subtitle: Text(
              //   'Contact: ${contact.contact}\nEmail: ${contact.email}',
              // ),
              // isThreeLine: true,
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<ContactsProvider>().removecontect(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {
                        context.read<ContactsProvider>().privatecontects(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detailpage');
        },
        tooltip: 'Go to another page',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
