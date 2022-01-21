import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

save(String key, dynamic value) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  if (value is bool) {
    sharedPrefs.setBool(key, value);
  } else if (value is String) {
    sharedPrefs.setString(key, value);
  } else if (value is int) {
    sharedPrefs.setInt(key, value);
  } else if (value is double) {
    sharedPrefs.setDouble(key, value);
  } else if (value is List<String>) {
    sharedPrefs.setStringList(key, value);
  } else if (value is Map) {
    sharedPrefs.setString(key, json.encode(value));
  }
}

Future<String?> getStringValuesSF(String? key) async {
  prefs = await SharedPreferences.getInstance();
  return prefs!.getString(key!);
}

Future<int?> getIntValuesSF(String key) async {
  prefs = await SharedPreferences.getInstance();
  return prefs!.getInt(key);
}

Future<double?> getDoubleValuesSF(String key) async {
  prefs = await SharedPreferences.getInstance();
  return prefs!.getDouble(key);
}

Future<bool?> getBoolValuesSF(String key) async {
  prefs = await SharedPreferences.getInstance();
  return prefs!.getBool(key);
}

// Future<Map<String?, dynamic>?> getObjectValueSF(String? key) async {
//   prefs = await SharedPreferences.getInstance();
//   return json.decode(prefs!.getString(key!));
// }

removeValues(String key) async {
  prefs = await SharedPreferences.getInstance();
  prefs!.remove(key);
}

removeListValues(List<String> key) async {
  prefs = await SharedPreferences.getInstance();
  for (int i = 0; i < key.length; i++) {
    prefs!.remove(key[i]);
  }
}

clearSF() async {
  prefs = await SharedPreferences.getInstance();
  prefs!.clear();
}