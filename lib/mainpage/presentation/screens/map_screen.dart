import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restaurent_app/core/const/AppConsts.dart';
import 'package:restaurent_app/core/widgets/search_text_input.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  TextEditingController search = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(36.661161, 4.914948);
  static const LatLng destinationLocation = LatLng(36.6496100, 4.9055667);

  static final CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: destinationLocation,
      // tilt: 59.440717697143555,
      zoom: 17);

  List<LatLng> polylineCoordiantes = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (ele) {
        currentLocation = ele;
        setState(() {});
      },
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.6496461, 4.90509343),
    zoom: 17,
    // zoom : 13.5
  );

  void getPolyLinePoint() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      // AppConst.googleApiKey,
      "AIzaSyAf2h9tJDd01X9k-ZDpTYQWDFJydA-wAXY",
      PointLatLng(
        sourceLocation.latitude,
        sourceLocation.longitude,
      ),
      PointLatLng(
        destinationLocation.latitude,
        destinationLocation.longitude,
      ),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordiantes.add(
          LatLng(
            point.latitude,
            point.longitude,
          ),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    log("here");
    getPolyLinePoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,

                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("route"),
                        points: polylineCoordiantes,
                        color: Colors.black,
                        width: 6,
                      )
                    },
                    markers: {
                      // const Marker(
                      //   markerId: MarkerId("source"),
                      //   position: sourceLocation,
                      // ),
                      Marker(
                        markerId: const MarkerId("current Location"),
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        anchor: Offset(0.5, 1.0),
                      ),
                      const Marker(
                        markerId: MarkerId("destination"),
                        position: destinationLocation,
                      ),
                    },
                    // onCameraMove: (position) {
                    //   log(position.zoom.toString());
                    // },
                  ),
                  Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back)),
                          searchBar(search),
                          Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the destination'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Widget searchBar(search) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(11)),
        border: Border.all(color: const Color(0xFFBEC5D1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: SearchFieledInput(
            fillColor: 0xFFFFFFFF,
            hintText: '     Search',
            textEditingController: search,
            textInputType: TextInputType.text),
      ),
    );
  }
}
