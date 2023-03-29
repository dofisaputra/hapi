import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hapi/app/modules/consultation/controllers/consultation_controller.dart';
import 'package:hapi/app/modules/consultation/views/card_doctor_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class SearchDoctorView extends GetView<ConsultationController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ConsultationController());
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        appBar: buildAppbar(size),
        body: Padding(
          padding: const EdgeInsets.all(20),
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
                            isMap: false,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(Size size) {
    return AppBar(
      backgroundColor: kNeutral10,
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: size.width,
      leading: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
            ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Konsultasi Dokter',
              style: TextStyle(
                fontFamily: kDefaultFontFamily,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: kNeutral100,
              ),
            ),
          ),
        ],
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
          hintText: "Cari dokter favoritmu",
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
                HeroIcons.magnifyingGlass,
                style: HeroIconStyle.solid,
                color: kNeutral70,
                size: 20,
              ),
            ),
          ),
        ),
        onEditingComplete: () {},
      ),
    );
  }
}
