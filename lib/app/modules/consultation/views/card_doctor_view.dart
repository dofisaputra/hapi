import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hapi/app/modules/consultation/controllers/consultation_controller.dart';
import 'package:hapi/app/modules/consultation/views/book_doctor_view.dart';
import 'package:hapi/app/modules/consultation/views/info_window_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CardDoctorView extends GetView<ConsultationController> {
  const CardDoctorView({
    super.key,
    required this.size,
    required this.userImage,
    required this.banner,
    required this.name,
    required this.status,
    required this.grade,
    required this.experience,
    required this.address,
    required this.rating,
    required this.patient,
    required this.latLng,
    required this.isMap,
  });

  final Size size;
  final String userImage;
  final String banner;
  final String name;
  final String status;
  final String grade;
  final String experience;
  final String address;
  final double rating;
  final int patient;
  final LatLng latLng;
  final bool isMap;

  @override
  Widget build(BuildContext context) {
    Get.put(ConsultationController());
    return GestureDetector(
      onTap: () {
        if (isMap) {
          controller.moveCamera(latLng: latLng);
          controller.customInfoWindowController.addInfoWindow!(
            InfoWindowView(
              userImage: userImage,
              banner: banner,
              name: name,
              status: status,
              grade: grade,
              experience: experience,
              address: address,
              rating: rating,
              patient: patient,
            ),
            latLng,
          );
        } else {
          Get.to(() => BookDoctorView(
              userImage: userImage,
              banner: banner,
              name: name,
              status: status,
              grade: grade,
              experience: experience,
              address: address,
              rating: rating,
              patient: patient));
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(24),
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kNeutral40),
          borderRadius: kDefaultBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("$kDefaultImagePath/$userImage.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kNeutral100,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            status,
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kNeutral70,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HeroIcon(
                            HeroIcons.star,
                            style: HeroIconStyle.solid,
                            color: kWarningMain,
                            size: 20,
                          ),
                          Text(
                            "$rating",
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kNeutral80,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(color: kNeutral40, thickness: 1),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      HeroIcon(
                        HeroIcons.user,
                        style: HeroIconStyle.outline,
                        color: kNeutral70,
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          grade,
                          style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kNeutral80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      HeroIcon(
                        HeroIcons.briefcase,
                        style: HeroIconStyle.outline,
                        color: kNeutral70,
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          experience,
                          style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kNeutral80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                HeroIcon(
                  HeroIcons.buildingOffice,
                  style: HeroIconStyle.outline,
                  color: kNeutral70,
                  size: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kNeutral80,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
