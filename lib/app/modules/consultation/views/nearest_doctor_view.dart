// ignore: import_of_legacy_library_into_null_safe
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hapi/app/modules/consultation/controllers/consultation_controller.dart';
import 'package:hapi/app/modules/consultation/views/card_doctor_view.dart';
import 'package:hapi/app/modules/consultation/views/info_window_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class NearestDoctorView extends GetView<ConsultationController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ConsultationController());
    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final latLng = LatLng(-6.2680495, 106.6845813);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              children: [
                Obx(
                  () => GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: (googleController) {
                      controller.mapController.complete(googleController);
                      controller.customInfoWindowController
                          .googleMapController = googleController;
                    },
                    onTap: (position) {
                      controller.isExpand.value = false;
                      controller.customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      controller.customInfoWindowController.onCameraMove!();
                    },
                    markers: Set<Marker>.of(controller.listDoctor
                        .map(
                          (data) => Marker(
                            markerId: MarkerId(data['id']),
                            position: LatLng(
                              data['location'][0],
                              data['location'][1],
                            ),
                            icon: controller.markerIcon.value,
                            infoWindow: InfoWindow(),
                            onTap: () {
                              controller
                                  .customInfoWindowController.addInfoWindow!(
                                InfoWindowView(
                                  userImage: data['user_image'],
                                  banner: data['banner'],
                                  name: data['name'],
                                  status: data['status'],
                                  grade: data['grade'],
                                  experience: data['experience'],
                                  address: data['address'],
                                  rating: data['rating'],
                                  patient: data['patient'],
                                ),
                                LatLng(
                                  data['location'][0],
                                  data['location'][1],
                                ),
                              );
                            },
                          ),
                        )
                        .toList()),
                    initialCameraPosition: CameraPosition(
                      target: latLng,
                      zoom: 15,
                    ),
                  ),
                ),
                CustomInfoWindow(
                  controller: controller.customInfoWindowController,
                  height: 98,
                  width: 222,
                  offset: 40,
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kNeutral10,
                              elevation: 0,
                              shape: kDefaultButtonShapeWithBorder,
                              padding: EdgeInsets.zero,
                            ),
                            child: HeroIcon(
                              HeroIcons.arrowLeft,
                              style: HeroIconStyle.outline,
                              color: kNeutral80,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kNeutral10,
                              elevation: 0,
                              shape: kDefaultButtonShapeWithBorder,
                              padding: EdgeInsets.zero,
                            ),
                            child: HeroIcon(
                              HeroIcons.share,
                              style: HeroIconStyle.outline,
                              color: kNeutral80,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: size.width,
                height: (controller.isExpand.value && viewInsets == 0)
                    ? size.height * 0.8
                    : size.height * 0.3,
                decoration: BoxDecoration(
                  color: kNeutral10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 44,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SearchInput(size: size),
                          Container(
                            width: 44,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.isExpand.value =
                                    !controller.isExpand.value;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kNeutral10,
                                elevation: 0,
                                shape: kDefaultButtonShapeWithBorder,
                                padding: EdgeInsets.zero,
                              ),
                              child: HeroIcon(
                                HeroIcons.adjustmentsHorizontal,
                                style: HeroIconStyle.outline,
                                color: kNeutral80,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: controller.listDoctor
                                .map(
                                  (data) => CardDoctorView(
                                    size: size,
                                    userImage: data['user_image'],
                                    banner: data['banner'],
                                    name: data['name'],
                                    status: data['status'],
                                    grade: data['grade'],
                                    experience: data['experience'],
                                    address: data['address'],
                                    rating: data['rating'],
                                    patient: data['patient'],
                                    latLng: LatLng(
                                      data['location'][0],
                                      data['location'][1],
                                    ),
                                    isMap: true,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.74,
      height: 52,
      child: TextField(
        controller: searchController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: kNeutral20,
          hintText: "Cari Lokasimu",
          contentPadding: EdgeInsets.only(left: 20),
          hintStyle: TextStyle(
            fontFamily: kDefaultFontFamily,
            color: kNeutral60,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: kDefaultBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: kPrimaryMain),
            borderRadius: kDefaultBorderRadius,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: HeroIcon(
                HeroIcons.mapPin,
                style: HeroIconStyle.solid,
                color: kNeutral70,
                size: 20,
              ),
            ),
          ),
        ),
        onEditingComplete: () {
          Get.to(() => NearestDoctorView());
        },
      ),
    );
  }
}
