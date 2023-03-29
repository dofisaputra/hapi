import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CreateForumView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        appBar: buildAppbar(size),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                margin: const EdgeInsets.only(top: 8),
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
                padding: const EdgeInsets.only(top: 16),
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
                margin: const EdgeInsets.only(top: 8),
                height: 120,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kNeutral20,
                    hintText: "Masukan deskripsi forum",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 10,
                bottom: 10,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Buat Forum',
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kNeutral10,
                        elevation: 0,
                        shape: kDefaultButtonShapeWithBorder,
                        padding: EdgeInsets.zero,
                      ),
                      child: HeroIcon(
                        HeroIcons.chartBarSquare,
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
    );
  }
}
