import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/assets/my_enum.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/check_in_out.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

import '../../../../../core/widget/line.dart';

class DetailMap extends StatefulWidget {
  final LatLng? startLocation;
  final AttendanceData? attendanceData;
  final TypeMap typeMap;
  CheckInOutModel? checkInOutModel;

  DetailMap(
      {this.startLocation,
      this.attendanceData,
      required this.typeMap,
      this.checkInOutModel});

  @override
  _DetailMap createState() => _DetailMap();
}

class _DetailMap extends State<DetailMap> {
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  String location = "Get Location ...";
  List<Placemark> placemarks = [];
  LatLng? _currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.startLocation == null) {
      _determinePosition().then((value) {
        _currentLocation = LatLng(value.latitude, value.longitude);
        setState(() {});
      });
    } else {
      _currentLocation = widget.startLocation!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyCons.width_screen * MyCons.heigh_percent,
          height: MyCons.heigh_screen * 0.2 * MyCons.width_percent,
          child: (_currentLocation != null) ? getMap() : Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: textWithIcon(icon: CupertinoIcons.location, text: location),
        ),
      ],
    );
  }

  Widget getMap() {
    switch (widget.typeMap) {
      case TypeMap.MAP_CHECK_IN:
        return Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package

            zoomGesturesEnabled: false, //enable Zoom in, out on map
            myLocationButtonEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: _currentLocation!, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() async {
                mapController = controller;
                await _moveCamera();
              });
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona; //when map is dragging
            },
            onCameraIdle: () async {
              //when map drag stops
              placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              // curentLocation = LatLng(cameraPosition!.target.latitude,
              //     cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang

                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();

                
              });
            },
          ),
          Center(
            //picker image on google map
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 50,
            ),
          ),
          Positioned(
              //widget to display location name
              bottom: 10 * MyCons.heigh_percent,
              left: 10 * MyCons.heigh_percent,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            var position = await _determinePosition();
                            _currentLocation =
                                LatLng(position.latitude, position.longitude);
                            await _moveCamera();
                          },
                          child: Icon(
                            Icons.gps_fixed,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      )),
                ),
              )),
        ]);
      default:
        return Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: false, //enable Zoom in, out on map
            myLocationButtonEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: _currentLocation!, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() async {
                mapController = controller;
                await _moveCamera();
              });
            },
            onCameraIdle: () async {
              //when map drag stops
              placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              // curentLocation = LatLng(cameraPosition!.target.latitude,
              //     cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();
              });
            },
          ),
          Center(
            //picker image on google map
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 50,
            ),
          ),
        ]);
    }
  }

  Future<void> _moveCamera() async {
    mapController!
        .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation!, 14));
    placemarks = await placemarkFromCoordinates(
        _currentLocation!.latitude, _currentLocation!.longitude);
    // curentLocation = startLocation;
    setState(() {
      //get place name from lat and lang
      location = placemarks.first.administrativeArea.toString() +
          ", " +
          placemarks.first.street.toString() +
          ", " +
          placemarks.first.postalCode.toString();
          if (widget.checkInOutModel != null)
                  widget.checkInOutModel?.location =
                      "${_currentLocation!.latitude},${_currentLocation!.longitude}";
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
