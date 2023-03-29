import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/forum/controllers/forum_controller.dart';
import 'package:hapi/app/modules/forum/views/card_post_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class DetailCommunityView extends GetView<ForumController> {
  final String title;
  final String desc;
  final String createdAt;
  final String image;
  final String banner;
  final int member;
  final int postCount;
  final int topicCount;

  const DetailCommunityView({
    super.key,
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.image,
    required this.banner,
    required this.member,
    required this.postCount,
    required this.topicCount,
  });

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
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: 155,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("$kDefaultImagePath/$banner"),
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
                              HeroIcons.share,
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
                          image: AssetImage("$kDefaultImagePath/$image"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kNeutral100,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: HeroIcon(
                          HeroIcons.checkBadge,
                          color: kPrimaryMain,
                          style: HeroIconStyle.solid,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 10),
                    child: Text(
                      desc,
                      style: TextStyle(
                        fontFamily: kDefaultFontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kNeutral70,
                      ),
                    ),
                  ),
                  Text(
                    "Dibuat pada $createdAt",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kNeutral70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            HeroIcon(
                              HeroIcons.userGroup,
                              style: HeroIconStyle.outline,
                              color: kNeutral70,
                              size: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$member",
                                    style: TextStyle(
                                      fontFamily: kDefaultFontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: kNeutral70,
                                    ),
                                  ),
                                  Text(
                                    "Anggota",
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
                        Row(
                          children: [
                            HeroIcon(
                              HeroIcons.chatBubbleLeftRight,
                              style: HeroIconStyle.outline,
                              color: kNeutral70,
                              size: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$postCount",
                                    style: TextStyle(
                                      fontFamily: kDefaultFontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: kNeutral70,
                                    ),
                                  ),
                                  Text(
                                    "Postingan",
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
                        Row(
                          children: [
                            HeroIcon(
                              HeroIcons.hashtag,
                              style: HeroIconStyle.solid,
                              color: kNeutral70,
                              size: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$topicCount",
                                    style: TextStyle(
                                      fontFamily: kDefaultFontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: kNeutral70,
                                    ),
                                  ),
                                  Text(
                                    "Topik",
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryMain,
                        elevation: 0,
                        minimumSize: Size(size.width, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: kDefaultBorderRadius,
                        ),
                      ),
                      child: Text(
                        "Gabung",
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
            Divider(
              color: kNeutral40,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 18),
                    child: Text(
                      "Postingan terbaru",
                      style: TextStyle(
                        fontFamily: kDefaultFontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kNeutral100,
                      ),
                    ),
                  ),
                  Column(
                    children: controller.hottestPost
                        .map(
                          (e) => CardPostView(
                            size: size,
                            id: e['id'],
                            userImage: "$kDefaultImagePath/${e['user_image']}",
                            username: e['username'],
                            createdAt: e['created_at'],
                            content: e['content'],
                            like: e['like'],
                            comment: e['comment'],
                            view: e['view'],
                            isPolling: e['isPolling'],
                            isComment: false,
                          ),
                        )
                        .toList(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
