import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/modelcontect.dart';

class ContactsProvider with ChangeNotifier {
  bool isanroid = true;

  int curruntindex = 0;
  List<Contact> privatecontect = [];
  List<Contact> contacts = [];

  void isplatform() {
    isanroid = !isanroid;
    notifyListeners();
  }

  void addcontect(Contact model) {
    contacts.add(model);
    notifyListeners();
  }

  void removecontect(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }

  void privatecontects(int index) {
    privatecontect.add(contacts[index]);
    contacts.removeAt(index);
    notifyListeners();
  }

  void removefomeprivte(int index) {
    contacts.add(privatecontect[index]);
    privatecontect.removeAt(index);
    notifyListeners();
  }

  void getindex(int index) {
    index = curruntindex;
  }

  void updateContact(Contact updatedContact) {
    contacts[curruntindex] = updatedContact;
    notifyListeners();
  }

  void launchCaller(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void launchEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeQueryComponent('Subject=Hello&Body=Message here'),
    );
    await launchUrl(launchUri);
  }

  void addToprivatecontect(Contact model) {
    privatecontect.add(model);
    notifyListeners();
  }

  void removeToPrivatecontect(index) {
    privatecontect.removeAt(index);
    notifyListeners();
  }
}
