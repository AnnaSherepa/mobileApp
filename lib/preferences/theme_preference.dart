import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themeKey = "theme_style";

  setTheme(bool value) {
    SharedPreferences.getInstance().then((sp) => sp.setBool(themeKey, value));
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeKey) ?? false;
  }
}
