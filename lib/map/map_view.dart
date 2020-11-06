import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gyms Near You',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gyms Near You'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //GoogleMapController myController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(39.035591, -94.577873);
  LatLng _lastMapPosition = _center;
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('gym1'),
      position: LatLng(39.056889, -94.586449),
      infoWindow: InfoWindow(title: 'BodyFit KC ', snippet: "Cross-Fit"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueAzure,
      ),
    ),
    Marker(
      markerId: MarkerId('gym2'),
      position: LatLng(39.061910, -94.590750),
      infoWindow: InfoWindow(title: 'GYMKC:uptown', snippet: "Cardio"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueAzure,
      ),
    ),
    Marker(
      markerId: MarkerId('gym3'),
      position: LatLng(39.040988, -94.571315),
      infoWindow: InfoWindow(title: 'Planet Fitness', snippet: "Builder"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueAzure,
      ),
    ),
    Marker(
      markerId: MarkerId('gym4'),
      position: LatLng(39.038953, -94.587905),
      infoWindow: InfoWindow(title: 'Yoga Barre Fitness', snippet: "Top"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueAzure,
      ),
    ),
  };

  static final CameraPosition initCameraPosition = CameraPosition(
    target: LatLng(39.035591, -94.577873),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.035591, -94.577873),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // void _pinHere() {
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId(_lastMapPosition.toString()),
  //       position: _lastMapPosition,
  //       infoWindow: InfoWindow(
  //         title: 'Hello here',
  //         snippet: 'Super!',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }

  void _onCamMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: initCameraPosition,
            compassEnabled: true,
            markers: _markers,
            onCameraMove: _onCamMove,
          ),
        ],
      ),
    );
  }
}
