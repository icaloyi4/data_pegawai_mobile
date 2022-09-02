import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../assets/my_cons.dart';
import '../assets/my_enum.dart';
import 'line.dart';
import 'styling.dart';

class MapPickerPage extends StatefulWidget {
  @override
  _MapPickerPage createState() => _MapPickerPage();
}

class _MapPickerPage extends State<MapPickerPage> {
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng? startLocation;
  LatLng? curentLocation;
  String location = "Get Location ...";
  List<Placemark> placemarks = [];
  var typeMap = TypeMap.MAP_PICKER;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mapController?.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition().then((value) async {
      try {
        if (Get.arguments != null) {
          var latlong = Get.arguments[0].toString().split(",");
          typeMap = Get.arguments[1];
          if (typeMap == TypeMap.MAP_OPEN) {
            startLocation = LatLng(double.parse(latlong[0].toString()),
                double.parse(latlong[1].toString()));
            curentLocation = LatLng(double.parse(latlong[0].toString()),
                double.parse(latlong[1].toString()));
          } else if (typeMap == TypeMap.MAP_PICKER) {
            startLocation = LatLng(double.parse(latlong[0].toString()),
                double.parse(latlong[1].toString()));
            curentLocation = LatLng(double.parse(latlong[0].toString()),
                double.parse(latlong[1].toString()));
          } else {
            startLocation = LatLng(value.latitude, value.longitude);
            curentLocation = LatLng(value.latitude, value.longitude);
          }
        } else {
          startLocation = LatLng(value.latitude, value.longitude);
          curentLocation = LatLng(value.latitude, value.longitude);
        }
      } catch (e) {
        startLocation = LatLng(value.latitude, value.longitude);
        curentLocation = LatLng(value.latitude, value.longitude);
      }
      setState(() {});
      // await _moveCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (startLocation != null)
        ? Scaffold(
            appBar: AppBar(
              title: Text("Pick Company Location",
                  style: styleHeader(
                      textStyleWeight: TextStyleWeight.Title3,
                      color: MyCons.darkModeEnabled
                          ? Colors.white
                          : Colors.black54)),
            ),
            body: _getMapByType())
        : Scaffold(
            appBar: AppBar(
              title: Text("Pick Company Location",
                  style: styleHeader(
                      textStyleWeight: TextStyleWeight.Title3,
                      color: MyCons.darkModeEnabled
                          ? Colors.white
                          : Colors.black54)),
            ),
            body: Container());
  }

  //FUNCTION
  Future<void> _moveCamera() async {
    mapController!
        .animateCamera(CameraUpdate.newLatLngZoom(curentLocation!, 14));
    placemarks = await placemarkFromCoordinates(
        curentLocation!.latitude, curentLocation!.longitude);
    // curentLocation = startLocation;
    setState(() {
      //get place name from lat and lang
      location = placemarks.first.administrativeArea.toString() +
          ", " +
          placemarks.first.street.toString();
    });
  }

  Widget _getMapByType() {
    switch (typeMap) {
      case TypeMap.MAP_OPEN:
        return Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation!, //initial position
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
              curentLocation = LatLng(cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
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
              bottom: 50,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.map_pin,
                                size: 25,
                              ),
                              title: Text(
                                location,
                                style: TextStyle(fontSize: 18),
                              ),
                              dense: true,
                            ),
                          ),
                        ],
                      )),
                ),
              )),
        ]);
      case TypeMap.MAP_CHECK_IN:
        return Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation!, //initial position
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
            top: 15,
            right: 15,
            child: GestureDetector(
              onTap: () async {
                var pos = await _determinePosition();
                curentLocation = LatLng(pos.latitude, pos.longitude);
                await _moveCamera();
              },
              child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        //  if it has a background color
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Icon(
                      Icons.my_location_rounded,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          Positioned(
              //widget to display location name
              bottom: 50,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Get.back(result: [curentLocation, placemarks]);
                  },
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  CupertinoIcons.map_pin,
                                  size: 25,
                                ),
                                title: Text(
                                  location,
                                  style: TextStyle(fontSize: 18),
                                ),
                                dense: true,
                              ),
                            ),
                            line(1.0, 15.0, Colors.grey[300]),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.check_mark,
                                color: Colors.green,
                                size: 25,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )),
        ]);
      default:
        return Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation!, //initial position
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
              curentLocation = LatLng(cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
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
            top: 15,
            right: 15,
            child: GestureDetector(
              onTap: () async {
                var pos = await _determinePosition();
                curentLocation = LatLng(pos.latitude, pos.longitude);
                await _moveCamera();
              },
              child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        // The child of a round Card should be in round shape
                        //  if it has a background color
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Icon(
                      Icons.my_location_rounded,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          Positioned(
              //widget to display location name
              bottom: 50,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Get.back(result: [curentLocation, placemarks]);
                  },
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  CupertinoIcons.map_pin,
                                  size: 25,
                                ),
                                title: Text(
                                  location,
                                  style: TextStyle(fontSize: 18),
                                ),
                                dense: true,
                              ),
                            ),
                            line(1.0, 15.0, Colors.grey[300]),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.check_mark,
                                color: Colors.green,
                                size: 25,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )),
        ]);
    }
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
