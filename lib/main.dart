import 'package:flutter/material.dart';

import 'models/car.dart';
import 'screens/booking_screen.dart';
import 'screens/car_details_screen.dart';
import 'screens/cars_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DriveNowApp());
}

class DriveNowApp extends StatefulWidget {
  const DriveNowApp({super.key});

  @override
  State<DriveNowApp> createState() => _DriveNowAppState();
}

class _DriveNowAppState extends State<DriveNowApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    CarsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriveNow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppTheme.primary,
          unselectedItemColor: const Color(0xFF6C757D),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car_outlined),
              activeIcon: Icon(Icons.directions_car),
              label: 'Cars',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CarDetailsScreen.routeName:
            final car = settings.arguments as Car?;
            if (car == null) {
              return MaterialPageRoute(
                builder: (_) => const CarsScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (_) => CarDetailsScreen(car: car),
            );
          case '/booking':
            final car = settings.arguments as Car?;
            if (car == null) {
              return MaterialPageRoute(
                builder: (_) => const CarsScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (_) => BookingScreen(car: car),
            );
          case '/cars':
            final args = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (_) => CarsScreen(initialFilter: args),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
        }
      },
    );
  }
}
