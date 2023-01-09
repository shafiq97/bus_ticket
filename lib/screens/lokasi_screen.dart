import 'dart:convert';
import 'dart:developer';

import 'package:bus_ticket/screens/get_location.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticket/model/nearby_response.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class LokasiScreen extends StatefulWidget {
  const LokasiScreen({Key? key}) : super(key: key);

  @override
  State<LokasiScreen> createState() => _LokasiScreenState();
}

class _LokasiScreenState extends State<LokasiScreen> {
  String apiKey = "AIzaSyC9XbLY2QHCWNqpzwZa74mfvt19Otk4ZIw";
  String radius = "30";

  double latitude = 31.5111093;
  double longitude = 74.279664;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Places'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    getNearbyPlaces();
                  },
                  child: const Text("Get Nearby Places")),
            ),
            if (nearbyPlacesResponse.results != null)
              for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
                nearbyPlacesWidget(nearbyPlacesResponse.results![i])
          ],
        ),
      ),
    );
  }

  void getNearbyPlaces() async {
    Position position = await CurrentLocationScreenState().determinePosition();
    log(position.latitude.toString());
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            position.latitude.toString() +
            ',' +
            position.longitude.toString() +
            '&radius=' +
            radius +
            '&key=' +
            apiKey);

    var response = await http.post(url);
    log(response.body);
    nearbyPlacesResponse =
        NearbyPlacesResponse.fromJson(jsonDecode(response.body));

    setState(() {});
  }

  Widget nearbyPlacesWidget(Results results) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text("Name: " + results.name!),
          Text("Location: " +
              results.geometry!.location!.lat.toString() +
              " , " +
              results.geometry!.location!.lng.toString()),
          Text(results.openingHours != null ? "Open" : "Closed"),
        ],
      ),
    );
  }
}
