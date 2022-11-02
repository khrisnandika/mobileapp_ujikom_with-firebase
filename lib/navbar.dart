import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:latihan_ujikom/Component/constant.dart';
import 'package:latihan_ujikom/geolocation.dart';
import 'package:latihan_ujikom/global.dart';
import 'package:latihan_ujikom/home_screen.dart';
import 'package:latihan_ujikom/dashboard_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final global = Global();
  List Pindah = [DashboardScreen(), GeoLocScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Pindah[global.index],
      bottomNavigationBar: Container(
        color: Color(0xff17262b),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20,
          ),
          child: GNav(
            selectedIndex: global.index,
            backgroundColor: Color(0xff17262b),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: kDigitalent,
            gap: 8,
            onTabChange: (i) {
              setState(() {
                global.index = i;
              });
            },
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.location_city,
                text: 'Location',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profiile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
