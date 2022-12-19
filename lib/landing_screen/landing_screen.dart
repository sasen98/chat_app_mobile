import 'package:chat_app/home_screen/screens/home_screen.dart';
import 'package:chat_app/search/screens/search_screen.dart';
import 'package:chat_app/settings/settings_screen.dart';
import 'package:chat_app/shop/screens/shop_screen.dart';
import 'package:chat_app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Widget> _screenList = const [
    HomeScreen(),
    SearchScreen(),
    ShopScreen(),
    SettingsScreen()
  ];

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, selectedIndex, _) {
            return _screenList.elementAt(selectedIndex);
          }),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, selectedIndex, _) {
            return BottomNavigationBar(
              onTap: (val) {
                _selectedIndex.value = val;
              },
              selectedItemColor: Colors.blue,
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
            );
          }),
    );
  }
}
