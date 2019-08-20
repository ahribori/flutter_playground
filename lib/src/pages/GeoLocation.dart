import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  bool _pending = false;
  double _lat = 0;
  double _long = 0;

  track() async {
    setState(() {
      _pending = true;
    });
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    print(geolocationStatus);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _lat = position.latitude;
      _long = position.longitude;
      _pending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "내 위치는",
              style: TextStyle(fontSize: 24),
            ),
            !_pending ? Text("$_lat, $_long") : CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          track();
        },
        child: Icon(Icons.gps_fixed),
      ),
    );
  }
}
