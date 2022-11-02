import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_ujikom/Animation/fade_animation.dart';
import 'package:latihan_ujikom/Component/constant.dart';
import 'package:latihan_ujikom/geolocation.dart';
import 'package:latihan_ujikom/home_screen.dart';
import 'package:latihan_ujikom/navbar.dart';
import 'package:latihan_ujikom/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // registerSubmit() async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: _emailController.text.toString().trim(),
  //       password: _passwordController.text,
  //     );
  //   } catch (e) {
  //     print(e);
  //     SnackBar(content: Text(e.toString()));
  //   }
  // }

  loginSubmit() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then(
            (value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: '',),
              ),
            ),
          );
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 90,
                        top: 60,
                        width: 200,
                        height: 200,
                        child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/digitalent.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: FadeAnimation(
                          1.6,
                          Container(
                            padding: EdgeInsets.only(top: 350),
                            child: Center(
                              child: Text(
                                "Selamat Datang",
                                style: GoogleFonts.montserrat(
                                    color: kDigitalent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                // style: TextStyle(
                                //   color: kDigitalent,
                                //   fontSize: 18,
                                //   // fontWeight: FontWeight.bold,
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: GoogleFonts.montserrat(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: GoogleFonts.montserrat(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () => loginSubmit(),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(10, 125, 254, 1.0000),
                                    Color.fromRGBO(10, 125, 254, .600),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Masuk",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        1.5,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Tidak Memiliki Akun?",
                                  style: GoogleFonts.montserrat(
                                    color: kGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Buat Akun",
                                  style: GoogleFonts.montserrat(
                                    color: kDigitalent,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
