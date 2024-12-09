import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator>
    with SingleTickerProviderStateMixin {
  bool isUser = false;
  int _selectedIndex = 0;
  final List<Widget> _myWidgetPages = [
    Container(
      color: Colors.amber,
      child: const Text("Home"),
    ),
    Container(
      color: Colors.red,
      child: const Text("Cart"),
    ),
    Container(
      color: Colors.blue,
      child: const Text("Courses"),
    ),
    const AuthPage(),
  ];

  void _selectedIndexTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _myWidgetPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        selectedItemColor: MyColors.myThirdColor,
        selectedIconTheme: const IconThemeData(size: 25),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        enableFeedback: true,
        unselectedFontSize: 14,
        backgroundColor: MyColors.mySecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: "Courses",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _selectedIndexTap,
      ),
    );
  }
}
