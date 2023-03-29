import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/consultation/controllers/consultation_controller.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class BookDoctorView extends GetView<ConsultationController> {
  const BookDoctorView({
    super.key,
    required this.userImage,
    required this.banner,
    required this.name,
    required this.status,
    required this.grade,
    required this.experience,
    required this.address,
    required this.rating,
    required this.patient,
  });

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
    Get.put(ConsultationController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: 155,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("$kDefaultImagePath/$banner.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 105),
                    child: Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kNeutral10,
                          width: 4,
                          strokeAlign: 0,
                        ),
                        image: DecorationImage(
                          image:
                              AssetImage("$kDefaultImagePath/$userImage.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
                                  fontSize: 18,
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
                                  fontSize: 14,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kNeutral90,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
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
                    ),
                    Row(
                      children: [
                        HeroIcon(
                          HeroIcons.users,
                          style: HeroIconStyle.outline,
                          color: kNeutral70,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "$patient Pasien",
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Divider(
                        color: kNeutral40,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "Jadwal dan waktu konsultasi",
                      style: TextStyle(
                        fontFamily: kDefaultFontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kNeutral100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Tanggal",
                        style: TextStyle(
                          color: kNeutral90,
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Ink(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: kDefaultBorderRadius,
                            color: kNeutral20,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: HeroIcon(
                                  HeroIcons.calendar,
                                  style: HeroIconStyle.solid,
                                  color: kNeutral90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "22 Feb 2023",
                                  style: TextStyle(
                                    color: kNeutral90,
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        "Waktu sesi",
                        style: TextStyle(
                          color: kNeutral90,
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () {
                              controller.selectedTimeBook.value = index;
                            },
                            borderRadius: kDefaultBorderRadius,
                            child: Ink(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color:
                                    index == controller.selectedTimeBook.value
                                        ? kPrimaryMain
                                        : kNeutral20,
                                borderRadius: kDefaultBorderRadius,
                              ),
                              child: Text(
                                "${index + 14}.00",
                                style: TextStyle(
                                  color:
                                      index == controller.selectedTimeBook.value
                                          ? kNeutral10
                                          : kNeutral100,
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        "Durasi sesi",
                        style: TextStyle(
                          color: kNeutral90,
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.durationBook.value > 1) {
                                controller.durationBook.value--;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kNeutral10,
                              elevation: 0,
                              shape: kDefaultButtonShapeWithBorder,
                              padding: EdgeInsets.zero,
                            ),
                            child: HeroIcon(
                              HeroIcons.minus,
                              style: HeroIconStyle.solid,
                              color: kNeutral80,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Center(
                            child: Text(
                              "${controller.durationBook.value} Jam",
                              style: TextStyle(
                                color: kNeutral100,
                                fontFamily: kDefaultFontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.durationBook.value < 12) {
                                controller.durationBook.value++;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kNeutral10,
                              elevation: 0,
                              shape: kDefaultButtonShapeWithBorder,
                              padding: EdgeInsets.zero,
                            ),
                            child: HeroIcon(
                              HeroIcons.plus,
                              style: HeroIconStyle.solid,
                              color: kNeutral80,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.checkbox.value =
                                  !controller.checkbox.value;
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastLinearToSlowEaseIn,
                              padding: EdgeInsets.all(2),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: controller.checkbox.value
                                    ? kPrimaryMain
                                    : kNeutral10,
                                border: controller.checkbox.value
                                    ? null
                                    : Border.all(color: kNeutral50, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: controller.checkbox.value
                                  ? Icon(
                                      Icons.check,
                                      color: kNeutral10,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                              text: "Saya menyetujui ",
                              style: TextStyle(
                                color: kNeutral90,
                                fontFamily: kDefaultFontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "Syarat dan Ketentuan",
                                  style: TextStyle(
                                    color: kInfoMain,
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 38),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: size.width,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: kNeutral40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rp. 120.000",
              style: TextStyle(
                color: kNeutral100,
                fontFamily: kDefaultFontFamily,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryMain,
                elevation: 0,
                minimumSize: Size.zero,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: kDefaultBorderRadius,
                ),
              ),
              child: Text(
                "Buat Jadwal",
                style: TextStyle(
                  fontFamily: kDefaultFontFamily,
                  color: kNeutral10,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
