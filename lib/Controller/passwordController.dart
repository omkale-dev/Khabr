import 'package:shared_preferences/shared_preferences.dart';

class PasswordController {
  //save password and email
  static Future<void> savePassword({String password, String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
    prefs.setString("email", email);
    prefs.setBool("logout", true);
  }

  //save password and email
  static Future<bool> checkPassword({String password, String email}) async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    if (password == prefs.getString("password") &&
        email == prefs.getString("email")) {
      prefs.setBool("logout", true);

      return true;
    }
    return false;
  }

  //if already signin
  static Future<bool> isSignin() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("password") && prefs.containsKey("email")) {
      return true;
    } else {
      return false;
    }
  }

  static logout() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("logout", false);
  }

  static checkLoggedOut() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("logout")) {
      return prefs.getBool("logout");
    } else {
      return false;
    }
  }
}
