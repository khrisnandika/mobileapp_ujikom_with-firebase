import 'package:flutter/material.dart';
import 'package:latihan_ujikom/geolocation.dart';
import 'package:latihan_ujikom/login_screen.dart';

class SideBarScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Krisna Choiril Andika"),
          currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("")),
          accountEmail: Text("khrisnandika@gmail.com"),
        ),
        DrawerListTile(
          iconData: Icons.home,
          title: "Home",
          onTilePressed: (() {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: ((context) => GeoLocScreen()))
            );
          }),
        ),
        DrawerListTile(
          iconData: Icons.person,
          title: "Register",
          onTilePressed: (() {
            
          }),
        ),
        // DrawerListTile(
        //   iconData: Icons.folder,
        //   title: "My File",
        //   onTilePressed: () {},
        // ),
        // DrawerListTile(
        //   iconData: Icons.group,
        //   title: "Share With Me",
        //   onTilePressed: () {},
        // ),
        // DrawerListTile(
        //   iconData: Icons.restore,
        //   title: "Recent",
        //   onTilePressed: () {},
        // ),
        // DrawerListTile(
        //   iconData: Icons.delete,
        //   title: "Trash",
        //   onTilePressed: () {},
        // ),
        const Divider(thickness: 1),
        // DrawerListTile(
        //   iconData: Icons.turned_in,
        //   title: "Family",
        //   onTilePressed: () {},
        // ),
        DrawerListTile(
            iconData: Icons.logout,
            title: "Log Out",
            onTilePressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            })
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {required this.iconData,
      required this.title,
      required this.onTilePressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
