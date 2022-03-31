import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{
  static const THEME_STATUS = "THEMESTATUS";
  static SharedPreferences? loginprefs;

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
