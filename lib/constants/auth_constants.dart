import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/shared_prefs_services.dart';

class SharedPrefsKey {
  SharedPrefsKey._();
  static const String authKey = "auth-key";
}

void storeValue({required String key, required String value}) {
  locator<SharedPrefsServices>().setString(key: key, value: value);
}

String? getValue({required String key}) {
  return locator<SharedPrefsServices>().getString(key: key);
}
