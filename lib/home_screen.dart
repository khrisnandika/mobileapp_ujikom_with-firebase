// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_ujikom/Component/constant.dart';
import 'package:latihan_ujikom/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String phone = '';
  String alamat = '';

  List<String> docIDs = [];

  Future getDocId() async {
    // await FirebaseFirestore.instance.collection('users').get().then(
    //       (snapshot) => snapshot.docs.forEach(
    //         (document) {
    //           print(document.reference);
    //           docIDs.add(document.reference.id);
    //         },
    //       ),
    //     );
    var result = await _firebaseFirestore
        .collection('user_details')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      phone = result.docs[0]['nomor_hp'];
      alamat = result.docs[0]['alamat'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg2.jpg'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Informasi Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage(
                          'assets/avatar.png',
                        ),
                        height: 120,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _namaController..text = user!.displayName!,
                      ),
                      TextFormField(
                        controller: _nomorController..text = phone!,
                      ),
                      TextFormField(
                        controller: _emailController..text = user!.email!,
                      ),
                      TextFormField(
                        controller: _alamatController..text = alamat!,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(phone),
                      // Text(user?.email ?? 'Unknown'),
                      // Text(alamat),
                      new SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            user?.updateDisplayName(_namaController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kDigitalent,
                          ),
                          child: Text('Edit'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new SizedBox(
                        height: 45,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kOrangeColor,
                          ),
                          child: Text('Logout'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: 50,
    //         ),
    //         Text(
    //           'Informasi Profile',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 30,
    //             color: kTitleTextColor,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Image(
    //           image: AssetImage(
    //             'assets/avatar.png',
    //           ),
    //           height: 120,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextFormField(
    //           controller: _namaController..text = user!.displayName!,
    //         ),
    //         TextFormField(
    //           controller: _nomorController..text = phone!,
    //         ),
    //         TextFormField(
    //           controller: _emailController..text = user!.email!,
    //         ),
    //         TextFormField(
    //           controller: _alamatController..text = alamat!,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         // Text(phone),
    //         // Text(user?.email ?? 'Unknown'),
    //         // Text(alamat),
    //         ElevatedButton(
    //           onPressed: () {
    //             user?.updateDisplayName(_namaController.text);
    //           },
    //           child: Text('edit'),

    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Expanded(
    //       child: FutureBuilder(
    //         future: getDocId(),
    //         builder: (context, snapshot) {
    //           return ListView.builder(
    //             itemCount: docIDs.length,
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 title: Text(docIDs[index]),
    //               );
    //             },
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
