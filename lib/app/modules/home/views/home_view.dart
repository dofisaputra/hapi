import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/article/views/article_view.dart';
import 'package:hapi/app/modules/consultation/views/consultation_view.dart';
import 'package:hapi/app/modules/home/views/card_article_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kNeutral10,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 8),
                    decoration: BoxDecoration(
                      color: kPrimaryMain,
                      borderRadius: kDefaultBorderRadius,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 56,
                          width: 56,
                          child: Image.asset("$kDefaultIconPath/great.png"),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Halo John!",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kNeutral30,
                              ),
                            ),
                            Text(
                              "Kamu terlihat bahagia!",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kNeutral10,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                minimumSize: Size.zero,
                                backgroundColor: kPrimarySurface,
                                elevation: 0,
                                shape: kDefaultButtonShape,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Lihat hasil angket",
                                    style: TextStyle(
                                      fontFamily: kDefaultFontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryMain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: HeroIcon(
                                      HeroIcons.chevronRight,
                                      style: HeroIconStyle.mini,
                                      color: kPrimaryMain,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryBorder,
                        width: 1,
                      ),
                      borderRadius: kDefaultBorderRadius,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          kNeutral30,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 14,
                            height: 14,
                            child: Image.asset("$kDefaultIconPath/quote.png")),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hidup bukan tentang menunggu badai berlalu, tetapi belajar menari ditengah hujan.",
                          style: TextStyle(
                            color: kPrimaryMain,
                            fontFamily: kDefaultFontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dadang Nurjaman",
                          style: TextStyle(
                            color: kNeutral60,
                            fontFamily: kDefaultFontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => ArticleView());
                              },
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              child: Ink(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kInfoSurface,
                                  border: Border.all(
                                      color: kPrimaryFocus, width: 0.3),
                                ),
                                child: HeroIcon(
                                  HeroIcons.newspaper,
                                  style: HeroIconStyle.outline,
                                  color: kInfoMain,
                                  size: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Artikel dan Tips",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral90,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => ConsultationView());
                              },
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              child: Ink(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kDangerSurface,
                                  border: Border.all(
                                      color: kPrimaryFocus, width: 0.3),
                                ),
                                child: Image.asset(
                                    "$kDefaultIconPath/stethoscope.png"),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Konsultasi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral90,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              child: Ink(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSuccessSurface,
                                  border: Border.all(
                                      color: kPrimaryFocus, width: 0.3),
                                ),
                                child: HeroIcon(
                                  HeroIcons.puzzlePiece,
                                  style: HeroIconStyle.outline,
                                  color: kSuccessMain,
                                  size: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Permainan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral90,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              child: Ink(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kWarningSurface,
                                  border: Border.all(
                                      color: kPrimaryFocus, width: 0.3),
                                ),
                                child: HeroIcon(
                                  HeroIcons.newspaper,
                                  style: HeroIconStyle.outline,
                                  color: kWarningMain,
                                  size: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Dashboard",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral90,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 6),
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 162,
                  child: CarouselSlider(
                    items: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 26),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0XFFE2327D), Color(0XFF71193F)],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Akan hadir!",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kSecondaryBorder,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "MOOD GAME",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFFFAE5A3),
                                  ),
                                ),
                                Text(
                                  "Games peningkat mood kamu.",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFFFAE5A3),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: kDefaultBorderRadius,
                                    border:
                                        Border.all(color: kNeutral10, width: 1),
                                  ),
                                  child: Text(
                                    "NANTIKAN!",
                                    style: TextStyle(
                                      fontFamily: kDefaultFontFamily,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: kNeutral40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset("$kDefaultImagePath/mood-game.png")
                          ],
                        ),
                      ),
                      Image.asset("$kDefaultImagePath/carousel2.png")
                    ],
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: index == 1 ? kPrimaryMain : kNeutral10,
                          shape: BoxShape.circle,
                          border: Border.all(color: kNeutral10, width: 1),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rekomendari buat kamu",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kNeutral100,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        splashRadius: 16,
                        padding: EdgeInsets.zero,
                        icon: HeroIcon(
                          HeroIcons.arrowLongRight,
                          style: HeroIconStyle.outline,
                          color: kNeutral100,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardArticleView(
                    image: "$kDefaultImagePath/article1.png",
                    title: "Tips jitu! Beberapa Cara menenangkan pikiran",
                    desc:
                        "Berikut ini tips bagi kalian yang ingin menenangkan pikiran...",
                    isFirst: true,
                    isLast: false,
                  ),
                  CardArticleView(
                    image: "$kDefaultImagePath/article2.png",
                    title: "Lelah pikiran? Lakukan ini agar anda nyaman!",
                    desc: "Bagi kamu yang sedang merasa lelah akan kehi....",
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: kNeutral10,
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: 82,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: SvgPicture.asset("$kDefaultIconPath/logo.svg"),
      ),
      actions: [
        Row(
          children: [
            Container(
              width: 64,
              height: 64,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kNeutral10,
                  elevation: 0,
                  shape: kDefaultButtonShapeWithBorder,
                  padding: EdgeInsets.zero,
                ),
                child: HeroIcon(
                  HeroIcons.bell,
                  style: HeroIconStyle.outline,
                  color: kNeutral80,
                  size: 20,
                ),
              ),
            ),
            Container(
              width: 64,
              height: 64,
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kNeutral10,
                  elevation: 0,
                  shape: kDefaultButtonShapeWithBorder,
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
      ],
    );
  }
}
