// ignore: import_of_legacy_library_into_null_safe
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/consultation/views/book_doctor_view.dart';
import 'package:hapi/constants.dart';

class InfoWindowView extends GetView {
  const InfoWindowView(
      {super.key,
      required this.userImage,
      required this.banner,
      required this.name,
      required this.status,
      required this.grade,
      required this.experience,
      required this.address,
      required this.rating,
      required this.patient});

  final String userImage;
  final String banner;
  final String name;
  final String status;
  final String grade;
  final String experience;
  final String address;
  final double rating;
  final int patient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookDoctorView(
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
        );
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kNeutral10,
                  borderRadius: kDefaultBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: kNeutral100.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              AssetImage("$kDefaultImagePath/$userImage.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kNeutral100,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            status,
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kNeutral70,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Triangle.isosceles(
              edge: Edge.BOTTOM,
              child: Container(
                color: kNeutral10,
                width: 20,
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
