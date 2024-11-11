import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  Future<void> setShow(bool isShow) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isshow', isShow);
  }

  Future<bool?> getShow() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isshow');
  }
}
//
// class Contact {
//   String name;
//   String contact;
//   String email;
//
//   Contact({
//     required this.name,
//     required this.contact,
//     required this.email,
//   });
// }
