import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/views/settings.dart';
import '../Utils/constants.dart';
import 'calendar_screen.dart';
import 'favorite_screen.dart';
import 'my_app_home_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      const  MyAppHomeScreen(),
      const FavoriteScreen(),
      CalendarScreen(),
      const Setting(),

    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          // navbar
          backgroundColor: Colors.white,
          elevation: 0,
          iconSize: 28,
          currentIndex: selectedIndex,
          selectedItemColor: kprimaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 0 ? Iconsax.home5 : Iconsax.home_1,

              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 1 ? Iconsax.heart5 : Iconsax.heart,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 2 ? Iconsax.calendar5 : Iconsax.calendar,
              ),
              label: "Meal Plan",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 3 ? Iconsax.setting_21 : Iconsax.setting_2,
              ),
              label: "Setting",
            ),
          ],
        ),
        body: page[selectedIndex],
      ),
    );

  }


  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
class itemsearch extends StatelessWidget {
  final Function(String) onChanged;

  itemsearch({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search by recipes',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}