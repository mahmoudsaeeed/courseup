import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/ViewProfile/presentation/views/my_view_profile.dart';
import 'package:courseup/features/create_course/presentation/views/my_create_course_view.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    MyMainAppBar(
      myBody: Container(
        color: Colors.amber,
        child: const Text("Home"),
      ),
    ),
    MyMainAppBar(
      myBody: Container(
        color: Colors.red,
        child: const Text("Cart"),
      ),
    ),
    const MyCreateCourseView(),
    BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthAuthenticated) {
        return const MyViewProfile();
      } else if (state is AuthLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyPages.myLoginPage);
                },
                child: const Text('Login')),
          ),
        );
      }
    })
  ];

  void _selectedIndexTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> myIconPages = const [
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
        icon: Icon(Icons.person_2_outlined),
        label: "Profile",
      ),
    ];
    return Scaffold(
      // appBar: AppBar(),
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
        items: myIconPages,
        currentIndex: _selectedIndex,
        onTap: _selectedIndexTap,
      ),
    );
  }
}
