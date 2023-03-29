import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hapi/constants.dart';

class ConsultationController extends GetxController {
  final mapController = Completer<GoogleMapController>();
  final customInfoWindowController = CustomInfoWindowController();

  var markerIcon = BitmapDescriptor.defaultMarker.obs;
  var isExpand = false.obs;
  var selectedTimeBook = 0.obs;
  var durationBook = 1.obs;
  var checkbox = false.obs;

  List<dynamic> listDoctor = List.empty().obs;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "$kDefaultIconPath/map-pin-user-fill.png")
        .then(
      (icon) {
        markerIcon.value = icon;
      },
    );
  }

  void moveCamera({required LatLng latLng}) async {
    isExpand.value = false;

    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 16,
          // bearing: 192,
          // tilt: 59,
        ),
      ),
    );
  }

  void generateDummyListDoctor() {
    listDoctor = [
      {
        "id": "1",
        "user_image": "risa-olive",
        "banner": "user-banner",
        "name": "dr. Bambang Pamungkas",
        "status": "Spesialis Insomnia dan Depresi",
        "grade": "Profesional Dokter",
        "experience": "> 5 tahun",
        "address": "Jalan Pedati, Jakarta Pusat 12345",
        "rating": 4.5,
        "patient": 50,
        "location": [-6.2680495, 106.6845813]
      },
      {
        "id": "2",
        "user_image": "dunia-akhirat",
        "banner": "user-banner",
        "name": "dr. Sinta Jojo",
        "status": "Psikiater",
        "grade": "Dokter Rumah Sakit",
        "experience": "> 10 tahun",
        "address": "RS Rasa Sayang Jalan Ujung Jalan 33245",
        "rating": 5.0,
        "patient": 100,
        "location": [-6.264383, 106.690876]
      },
      {
        "id": "3",
        "user_image": "tony-setiawan",
        "banner": "user-banner",
        "name": "dr. Cemi Lanmanis",
        "status": "Psikolog",
        "grade": "Profesional Dokter",
        "experience": "> 2 tahun",
        "address": "Jalan Pedati, Jakarta Pusat 12345",
        "rating": 3.4,
        "patient": 20,
        "location": [-6.264927, 106.684224]
      }
    ];
  }

  @override
  void onInit() {
    setCustomMarkerIcon();
    generateDummyListDoctor();
    super.onInit();
  }

  @override
  void dispose() {
    customInfoWindowController.dispose();
    super.dispose();
  }
}
