import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/forum/controllers/forum_controller.dart';
import 'package:hapi/app/modules/forum/views/detail_post_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CardPostView extends GetView<ForumController> {
  const CardPostView({
    super.key,
    required this.size,
    required this.id,
    required this.userImage,
    required this.username,
    required this.createdAt,
    required this.content,
    required this.like,
    required this.comment,
    required this.view,
    required this.isPolling,
    required this.isComment,
  });

  final Size size;
  final String id;
  final String userImage;
  final String username;
  final String createdAt;
  final String content;
  final int like;
  final int comment;
  final int view;
  final bool isPolling;
  final bool isComment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          if (!isComment) {
            Get.to(() => DetailPostView(id: id));
          }
        },
        borderRadius: kDefaultBorderRadius,
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          width: size.width,
          decoration: BoxDecoration(
            color: kNeutral20,
            borderRadius: kDefaultBorderRadius,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Ink(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(userImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kNeutral100,
                              ),
                            ),
                            Text(
                              createdAt,
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        ),
                        isPolling
                            ? Ink(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  color: kSecondarySurface,
                                  border: Border.all(
                                      width: 1, color: kSecondaryBorder),
                                ),
                                child: Row(
                                  children: [
                                    HeroIcon(
                                      HeroIcons.chartBarSquare,
                                      style: HeroIconStyle.outline,
                                      size: 14,
                                      color: kPrimaryMain,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Polling",
                                      style: TextStyle(
                                        fontFamily: kDefaultFontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryMain,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                content,
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kNeutral100),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Row(
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
                        like.toString(),
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kNeutral70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  !isComment
                      ? Row(
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
                              comment.toString(),
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 20,
                  ),
                  !isComment
                      ? Row(
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
                              view.toString(),
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kNeutral70,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
