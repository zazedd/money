import 'package:shared_preferences/shared_preferences.dart';
import '../../geral/util.dart';

class userRole {
  static int? role;
}

void saveUserRole(int role) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('userRole', role);
}

Future<int?> getUserRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? res = prefs.getInt('userRole');
  print_("shared prefs got $res");
  return res;
}
