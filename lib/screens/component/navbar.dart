import 'package:build_app/screens/main_page/homepage.dart';
import 'package:build_app/screens/main_page/library.dart';
import 'package:build_app/screens/main_page/profile.dart';
import 'package:build_app/screens/main_page/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value, 
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index; 
          },
          height: 60,
          elevation: 0,
          destinations: [
            NavigationDestination(
              icon: controller.selectedIndex.value == 0
                  ? Icon(Icons.home_rounded, color: Colors.white) 
                  : Icon(Icons.home_outlined),           
              label: 'Home',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 1
                  ? Icon(Icons.search, color: Colors.white)
                  : Icon(Icons.search_outlined),
              label: 'Search',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 2
                  ? Icon(Icons.library_books, color: Colors.white)
                  : Icon(Icons.my_library_books_outlined),
              label: 'Library',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 3
                  ? ImageIcon(AssetImage('assets/images/Spotify.png'), color: Colors.white)
                  : ImageIcon(AssetImage('assets/images/Spotify.png')),
              label: 'Profile',
            ),
          ],
        ),
      ),
      // Body that updates based on selectedIndex
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    Search(),
    Library(),
    Profile(),
  ];
}
