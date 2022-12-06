import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/shared_prefs_services.dart';

class AppConstants {
  static final int? token = locator<SharedPrefsServices>().getInt(key: 'token');
}
