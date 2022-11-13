import 'package:chat_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setUpLpcator() {
  locator.registerSingleton<NavigationService>(NavigationService());
}
