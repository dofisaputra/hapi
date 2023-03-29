import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/consultation/views/card_history_view.dart';
import 'package:hapi/app/modules/consultation/views/nearest_doctor_view.dart';
import 'package:hapi/app/modules/consultation/views/search_doctor_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/consultation_controller.dart';

class ConsultationView extends GetView<ConsultationController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kNeutral10,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 76),
                    alignment: Alignment.bottomRight,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kSecondarySurface,
                    ),
                    child: Container(
                      width: size.width * 0.5,
                      child: Image.asset("$kDefaultImagePath/doctor.png"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.5,
                        child: Image.asset(
                            "$kDefaultImagePath/consultation-gradient.png"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
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
                                  backgroundColor: kNeutral10.withOpacity(0.7),
                                  elevation: 0,
                                  shape: kDefaultButtonShape,
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kNeutral10.withOpacity(0.7),
                                  elevation: 0,
                                  shape: kDefaultButtonShape,
                                  padding: EdgeInsets.zero,
                                ),
                                child: HeroIcon(
                                  HeroIcons.chatBubbleOvalLeftEllipsis,
                                  style: HeroIconStyle.outline,
                                  color: kNeutral80,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 24, bottom: 24),
                        width: 215,
                        child: RichText(
                          text: TextSpan(
                            text: "Konsultasi dengan ",
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: kNeutral100,
                            ),
                            children: [
                              TextSpan(
                                text: "Psikiater",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryMain,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: " hanya dalam genggaman anda"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 174,
                        padding: const EdgeInsets.only(left: 20, bottom: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: kPrimaryMain,
                            shape: kDefaultButtonShape,
                            elevation: 0,
                          ),
                          child: Text(
                            "Coba sekarang",
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kNeutral10,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 174,
                        padding: const EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: kNeutral10,
                            shape: kDefaultButtonShape,
                            elevation: 0,
                          ),
                          child: Text(
                            "Pelajari",
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kNeutral100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => NearestDoctorView());
                        },
                        borderRadius: kDefaultBorderRadius,
                        child: Ink(
                          padding: EdgeInsets.all(16),
                          height: 176,
                          width: size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kPrimarySurface,
                            borderRadius: kDefaultBorderRadius,
                            border: Border.all(width: 1, color: kPrimaryBorder),
                            boxShadow: [
                              BoxShadow(
                                color: kNeutral100.withOpacity(0.08),
                                blurRadius: 20,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeroIcon(
                                HeroIcons.mapPin,
                                color: kPrimaryMain,
                                style: HeroIconStyle.solid,
                                size: 50,
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Cari dokter terdekat",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryMain,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Daftar dokter terdekatmu",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kNeutral90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SearchDoctorView());
                        },
                        borderRadius: kDefaultBorderRadius,
                        child: Ink(
                          padding: EdgeInsets.all(16),
                          height: 176,
                          width: size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kSecondarySurface,
                            borderRadius: kDefaultBorderRadius,
                            border:
                                Border.all(width: 1, color: kSecondaryBorder),
                            boxShadow: [
                              BoxShadow(
                                color: kNeutral100.withOpacity(0.08),
                                blurRadius: 20,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeroIcon(
                                HeroIcons.chatBubbleOvalLeftEllipsis,
                                color: kSecondaryMain,
                                style: HeroIconStyle.solid,
                                size: 50,
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Konsultasi dengan dokter",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kSecondaryMain,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Dokter profesional siap menjawab",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kNeutral90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: Text(
                      "Jadwal dan Riwayat konsulltasi",
                      style: TextStyle(
                        fontFamily: kDefaultFontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kNeutral100,
                      ),
                    ),
                  ),
                  CardHistoryView(
                    size: size,
                    date: "Kamis 23 Feb , 12.00 - 14.00",
                    userImage: "$kDefaultImagePath/risa-olive.jpg",
                    name: "dr. Risa Olive",
                    status: "Psikiater",
                  ),
                  CardHistoryView(
                    size: size,
                    date: "Senin 19 Feb , 12.00 - 14.00",
                    userImage: "$kDefaultImagePath/dunia-akhirat.jpg",
                    name: "dr. Bambang Pamungkas",
                    status: "Psikiater",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
