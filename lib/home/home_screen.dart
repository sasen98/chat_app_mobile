import 'package:chat_app/demo/slider_creen.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.closeEndDrawer();
              } else {
                _scaffoldKey.currentState!.openEndDrawer();
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      // const CustomAppbarWidget(

      //   title: 'Home Screen',
      // ),
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          if (_scaffoldKey.currentState!.isDrawerOpen == false) {
            _scaffoldKey.currentState!.openDrawer();
          } else {
            _scaffoldKey.currentState!.openEndDrawer();
          }
        },
        child: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              child: Text('Drawer'),
            ),
            endDrawer: Drawer(
              width: 0.8.sw,
              backgroundColor: Colors.red,
              child: Text('EndDrawer'),
            ),
            body: Center(
              child: Column(
                children: [
                  const Text('Welcome to the app'),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SliderScreen()));
                    },
                    child: Text('Sliders'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      locator<NavigationService>()
                          .navigateTo(Routes.chatListScreenRoute);
                    },
                    child: const Text('Start Chat'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
