import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//  double latitude;
//  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // launching the next screen
      return LocationScreen(
        locationWeather:
            weatherData, // passing the acquired weather data to next screen
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  void checkIsLocationEnabled() async {
    bool isEnabled = await isLocationServiceEnabled();
    print('Baskar LocationServiceEnabled : $isEnabled');
  }

  /*
   Another way of defining a Function without using 'async' to method declaration and 'await' to
   function call of checkPermission(), but checkPermission() will return Future<LocationPermission> object
  */
  Future<LocationPermission> checkPermissionOfLocation() {
    Future<LocationPermission> permission = checkPermission();
    print("Baskar LocationPermission : $permission");
    return permission;
  }
}

/*
Widgets Life Cycle:
StatelessWidgets and StatefulWidgets:

StatelessWidget - Every-time a change in the Widget will replace the widget with new Widget Object.
No edition will happen on the existing object, if a change occurs to widget the old object is garbage
collected and new Widget instance is replaced in that position.

 For stateless widget there is no life cycle methods only build() method which should return a widget and its
 is available which is called by the system to create/build the instance of the StatelessWidget.

 Stateful Widget can be combined together and each state can be tracked using a state object. can
 change the state of properties using setState() method.
 It has several life cycle methods, which can be used inside State<StatefulWidget> class.
 1. initState() will be called first to initialize the state
 2. build() ( will be called by system to inflate and show the widget on the screen. If there are changes
                in the UI then this lifecycle method called multiple times)
 3. deactivate() will be called by system when the widget gets destroyed.



*/
