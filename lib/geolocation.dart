import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latihan_ujikom/Component/constant.dart';

class GeoLocScreen extends StatefulWidget {
  const GeoLocScreen({super.key});

  @override
  State<GeoLocScreen> createState() => _GeoLocScreenState();
}

class _GeoLocScreenState extends State<GeoLocScreen> {
  int _counter = 0;
  String location = 'Belum Mendapatkan Lat dan Long, Silahkan Tekan Button';
  String address = 'Mencari Lokasi...';
  Position _myPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              image: AssetImage('assets/globalmap.jpg'),
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
                  children: <Widget>[
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Icon(
                    //     Icons.menu,
                    //     color: Colors.white,
                    //   ),
                    //   // child: SvgPicture.asset(
                    //   //   'assets/back.svg',
                    //   //   height: 18,
                    //   // ),
                    // ),
                  ],
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
                      Text(
                        'Ayo Mulai',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Mencari Lokasi Anda',
                        style: TextStyle(
                          fontSize: 13,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image(
                        image: AssetImage(
                          'assets/lokasi.png',
                        ),
                        height: 150,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Position position = await _getGeoLocationPosition();
                          setState(() {
                            location =
                                '${position.latitude},${position.longitude}';
                          });
                          getAddressFromLongLat(position);
                        },
                        child: const Text('Cari Koordinat Anda'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Titik Koordinat Anda :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Alamat Anda :',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${address}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.white,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 42.0,
                            onPressed: () {
                              final intent = AndroidIntent(
                                  action: 'action_view',
                                  data: Uri.encodeFull(
                                      'google.navigation:q=${address}&avoid=tf'),
                                  package: 'com.google.android.apps.maps');
                              intent.launch();
                            },
                            color: kDigitalent,
                            child: Text('Kunjungi Alamat',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Ayo Cari Tujuan Anda',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Anda dapat mencari alamat yang anda inginkan',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage(
                          'assets/place.png',
                        ),
                        height: 150,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Lokasi Tujuan Anda',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.white,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 42.0,
                            onPressed: () {
                              final intent = AndroidIntent(
                                  action: 'action_view',
                                  data: Uri.encodeFull(
                                      'google.navigation:q=${address}&avoid=tf'),
                                  package: 'com.google.android.apps.maps');
                              intent.launch();
                            },
                            color: kDigitalent,
                            child: Text('Cari Alamat',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
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
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location Services Belum Aktif.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions Ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permission Ditolak, Gagal Request Permission.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.locality}, ${place.country}';
    });
  }
}
