import 'package:app_contect/ios/screens/private_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../porivider/homeprovider.dart';

class homepage_i extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactsProvider = context.watch<ContactsProvider>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Contacts List'),
        trailing: CupertinoSwitch(
          value: context.watch<ContactsProvider>().isanroid,
          onChanged: (value) {
            context.read<ContactsProvider>().isplatform();
          },
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.lock),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/private',
            );
          },
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: contactsProvider.contacts.length,
              itemBuilder: (context, index) {
                final contact = contactsProvider.contacts[index];

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/Detailspage',
                    arguments: contact,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CupertinoColors.systemGrey4,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.person),
                        SizedBox(width: 16),
                        Expanded(child: Text(contact.name)),
                        Row(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(CupertinoIcons.delete),
                              onPressed: () =>
                                  contactsProvider.removecontect(index),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(CupertinoIcons.lock),
                              onPressed: () =>
                                  contactsProvider.privatecontects(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: CupertinoButton(
                padding: EdgeInsets.all(16),
                color: CupertinoColors.activeBlue,
                borderRadius: BorderRadius.circular(30),
                child: Icon(CupertinoIcons.add, color: CupertinoColors.white),
                onPressed: () => Navigator.pushNamed(context, '/detail'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
