import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/forum/controllers/forum_controller.dart';
import 'package:hapi/app/modules/forum/views/card_post_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class SearchView extends GetView<ForumController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ForumController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kNeutral10,
      appBar: buildAppbar(size),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: controller.searchPost.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 6),
                      child: Text(
                        "Hasil pencarian untuk kata kunci “${controller.searchKeyword.value}”",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kNeutral100,
                        ),
                      ),
                    ),
                    Text(
                      "${controller.searchPost.length} postingan ditemukan",
                      style: TextStyle(
                        color: kNeutral70,
                        fontFamily: kDefaultFontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: controller.searchPost
                            .map(
                              (e) => CardPostView(
                                size: size,
                                id: e['id'],
                                userImage:
                                    "$kDefaultImagePath/${e['user_image']}",
                                username: e['username'].toString(),
                                createdAt: e['created_at'].toString(),
                                content: e['content'].toString(),
                                like: e['like'],
                                comment: e['comment'],
                                view: e['view'],
                                isPolling: e['isPolling'],
                                isComment: false,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, left: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kNeutral10,
                              elevation: 0,
                              shape: kDefaultButtonShapeWithBorder,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Text(
                              "Muat lainnya",
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
                )
              : Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: kDefaultBorderRadius,
                          color: kDangerSurface,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              child: Image.asset("$kDefaultIconPath/sick.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Tidak ditemukan data\n",
                                      style: TextStyle(
                                        fontFamily: kDefaultFontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: kDangerMain,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Pada Hasil pencarian untuk kata kunci “${controller.searchKeyword.value}”",
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        width: size.width,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: kDefaultButtonShape,
                            backgroundColor: kPrimarySurface,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.documentPlus,
                                style: HeroIconStyle.outline,
                                color: kPrimaryMain,
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Tambah Sekarang",
                                  style: TextStyle(
                                    fontFamily: kDefaultFontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryMain,
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
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forum Diskusi",
                  style: TextStyle(
                    color: kNeutral70,
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Pencarian",
                  style: TextStyle(
                    color: kNeutral100,
                    fontFamily: kDefaultFontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
