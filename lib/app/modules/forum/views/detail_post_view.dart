import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/forum/controllers/forum_controller.dart';
import 'package:hapi/app/modules/forum/detail_post_model.dart';
import 'package:hapi/app/modules/forum/views/card_post_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class DetailPostView extends GetView<ForumController> {
  const DetailPostView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final detailPost = DetailPost.fromJson(controller.getDetailPost(id: id));
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kNeutral10,
      appBar: buildAppbar(size: size),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "$kDefaultImagePath/${detailPost.userImage}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${detailPost.username}",
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kNeutral100,
                              ),
                            ),
                            Text(
                              "${detailPost.createdAt}",
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: detailPost.tags!
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: kDefaultBorderRadius,
                                color: kPrimarySurface,
                              ),
                              child: Text(
                                "#$e",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kNeutral70,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Text(
                    "${detailPost.content}",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: !detailPost.isPolling!
                        ? Text(
                            "${detailPost.desc}",
                            style: TextStyle(
                              fontFamily: kDefaultFontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: kNeutral80,
                            ),
                          )
                        : Obx(
                            () => Column(
                              children: detailPost.pooling!
                                  .asMap()
                                  .map(
                                    (key, value) => MapEntry(
                                      key,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: InkWell(
                                          onTap: () {
                                            controller.selectedPolling.value =
                                                key;
                                          },
                                          borderRadius: kDefaultBorderRadius,
                                          child: Ink(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 16,
                                              horizontal: 24,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  kDefaultBorderRadius,
                                              color: kNeutral20,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: kNeutral50,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: key ==
                                                              controller
                                                                  .selectedPolling
                                                                  .value
                                                          ? kPrimaryMain
                                                          : Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          kDefaultFontFamily,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: kNeutral90,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 48,
                          width: 108,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kNeutral40),
                            borderRadius: kDefaultBorderRadius,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.handThumbUp,
                                style: HeroIconStyle.outline,
                                color: kNeutral70,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${detailPost.like}",
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
                          height: 48,
                          width: 108,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kNeutral40),
                            borderRadius: kDefaultBorderRadius,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.chatBubbleLeft,
                                style: HeroIconStyle.outline,
                                color: kNeutral70,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${detailPost.comment}",
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
                          height: 48,
                          width: 108,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kNeutral40),
                            borderRadius: kDefaultBorderRadius,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.eye,
                                style: HeroIconStyle.outline,
                                color: kNeutral70,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${detailPost.view}",
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: detailPost.comments!
                    .map(
                      (e) => CardPostView(
                        size: size,
                        id: e.id!,
                        userImage: "$kDefaultImagePath/${e.userImage}",
                        username: e.username!,
                        createdAt: e.createdAt!,
                        content: e.content!,
                        like: e.like!,
                        comment: 0,
                        view: 0,
                        isPolling: false,
                        isComment: true,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppbar({required Size size}) {
    return AppBar(
      backgroundColor: kNeutral10,
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: size.width * 0.65,
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
        ],
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
                  HeroIcons.share,
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
                  HeroIcons.bookmark,
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
