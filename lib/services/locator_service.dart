import 'package:chat_app/services/demo_services.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/services/shared_prefs_services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setUpLpcator() {
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton<SharedPrefsServices>(SharedPrefsServices());
  locator.registerSingleton<DemoServices>(DemoServices());
}
