import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kNeutral10,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 155,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("$kDefaultImagePath/user-banner.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 32,
                              width: 60,
                              child: SvgPicture.asset(
                                  "$kDefaultIconPath/logo.svg"),
                            ),
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
                                  HeroIcons.pencilSquare,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 105),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                                image: AssetImage(
                                    "$kDefaultImagePath/user-image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Text(
                    "John Doe",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100,
                    ),
                  ),
                ),
                Text(
                  "johndoe@mail.com",
                  style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kNeutral70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Bergabung sejak 11 Februari 2023",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kNeutral90,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "120",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryMain,
                              ),
                            ),
                            Text(
                              "Catatan",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "73",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryMain,
                              ),
                            ),
                            Text(
                              "Forum",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "98",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryMain,
                              ),
                            ),
                            Text(
                              "Hari Bahagia",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "3x",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryMain,
                              ),
                            ),
                            Text(
                              "Konsultasi",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: kNeutral40,
                  thickness: 1,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 14, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PROFIL",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kNeutral70,
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {},
                    borderRadius: kDefaultBorderRadius,
                    child: Ink(
                      height: 40,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  color: kNeutral20,
                                ),
                                child: HeroIcon(
                                  HeroIcons.chatBubbleOvalLeftEllipsis,
                                  style: HeroIconStyle.outline,
                                  color: kNeutral80,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Pesan",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kNeutral90,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HeroIcon(
                              HeroIcons.chevronRight,
                              style: HeroIconStyle.mini,
                              color: kNeutral80,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {},
                    borderRadius: kDefaultBorderRadius,
                    child: Ink(
                      height: 40,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  color: kNeutral20,
                                ),
                                child: HeroIcon(
                                  HeroIcons.arrowPath,
                                  style: HeroIconStyle.outline,
                                  color: kNeutral80,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Riwayat Transaksi",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kNeutral90,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HeroIcon(
                              HeroIcons.chevronRight,
                              style: HeroIconStyle.mini,
                              color: kNeutral80,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "PENGATURAN",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kNeutral70,
                    ),
                  ),
                  SizedBox(height: 14),
                  InkWell(
                    onTap: () {},
                    borderRadius: kDefaultBorderRadius,
                    child: Ink(
                      height: 40,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  color: kNeutral20,
                                ),
                                child: HeroIcon(
                                  HeroIcons.bell,
                                  style: HeroIconStyle.outline,
                                  color: kNeutral80,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Notifikasi",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kNeutral90,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HeroIcon(
                              HeroIcons.chevronRight,
                              style: HeroIconStyle.mini,
                              color: kNeutral80,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {},
                    borderRadius: kDefaultBorderRadius,
                    child: Ink(
                      height: 40,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  color: kNeutral20,
                                ),
                                child: HeroIcon(
                                  HeroIcons.key,
                                  style: HeroIconStyle.outline,
                                  color: kNeutral80,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Change password",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kNeutral90,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HeroIcon(
                              HeroIcons.chevronRight,
                              style: HeroIconStyle.mini,
                              color: kNeutral80,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {},
                    borderRadius: kDefaultBorderRadius,
                    child: Ink(
                      height: 40,
                      width: size.width,
                      child: Row(
                        children: [
                          Ink(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: kDefaultBorderRadius,
                              color: kNeutral20,
                            ),
                            child: HeroIcon(
                              HeroIcons.arrowRightOnRectangle,
                              style: HeroIconStyle.outline,
                              color: kNeutral80,
                              size: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: kNeutral90,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
