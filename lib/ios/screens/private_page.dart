import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../porivider/homeprovider.dart';

class privatepage_i extends StatefulWidget {
  const privatepage_i({super.key});

  @override
  State<privatepage_i> createState() => _privatepage_iState();
}

class _privatepage_iState extends State<privatepage_i> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Private Contacts'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: context.watch<ContactsProvider>().privatecontect.length,
          itemBuilder: (context, index) {
            final contact =
                context.read<ContactsProvider>().privatecontect[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                color: CupertinoColors.white,
                child: CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.person,
                    color: CupertinoColors.activeBlue,
                  ),
                  title: Text(
                    contact.name,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    'Contact: ${contact.contact}\nEmail: ${contact.email}',
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoColors.inactiveGray,
                              fontSize: 14,
                            ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/Detailspage',
                      arguments: contact,
                    );
                  },
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.lock_open),
                    onPressed: () {
                      context.read<ContactsProvider>().removefomeprivte(index);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
