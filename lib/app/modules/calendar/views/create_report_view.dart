import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CreateReportView extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        appBar: buildAppbar(size),
        body: Container(
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
          width: size.width,
          child: Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Bagaimana mood mu hari ini?",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kNeutral90,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildEmoji(index: 0, emoji: "great"),
                            buildEmoji(index: 1, emoji: "good"),
                            buildEmoji(index: 2, emoji: "neutral"),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildEmoji(index: 3, emoji: "bad"),
                            buildEmoji(index: 4, emoji: "awful"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Kamu ${controller.emotions[controller.selectedEmoji.value]}",
                          style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.only(top: 10),
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
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Judul",
                      style: TextStyle(
                        color: kNeutral90,
                        fontFamily: kDefaultFontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 52,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kNeutral20,
                        hintText: "Masukan judul",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Deskripsi",
                      style: TextStyle(
                        color: kNeutral90,
                        fontFamily: kDefaultFontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 120,
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kNeutral20,
                        hintText: "Ceritakan harimu",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryMain,
                        elevation: 0,
                        minimumSize: Size(size.width, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: kDefaultBorderRadius,
                        ),
                      ),
                      child: Text(
                        "Simpan Catatan",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          color: kNeutral10,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildEmoji({required int index, required String emoji}) {
    return InkWell(
      onTap: () {
        controller.selectedEmoji.value = index;
      },
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Ink(
        padding: EdgeInsets.all(14),
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          color: controller.selectedEmoji.value == index
              ? kPrimarySurface
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset("$kDefaultIconPath/$emoji.png"),
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
              'Buat Catatan',
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
