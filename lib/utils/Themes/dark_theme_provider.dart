import 'package:flutter/foundation.dart';
import 'package:task_2/utils/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  SharedPreference darkThemePreference = SharedPreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}