import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/article/views/detail_article_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CardArticleView extends GetView {
  const CardArticleView({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.isFirst,
    required this.isLast,
  });

  final String image;
  final String title;
  final String desc;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isFirst ? 20 : 0, right: isLast ? 20 : 16),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailArticleView());
        },
        child: Container(
          width: 200,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: kDefaultBorderRadius,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: desc == ""
                    ? Center(
                        child: HeroIcon(
                          HeroIcons.playCircle,
                          style: HeroIconStyle.solid,
                          color: kNeutral10,
                          size: 42,
                        ),
                      )
                    : null,
              ),
              SizedBox(height: 12),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: kDefaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kNeutral100,
                ),
              ),
              SizedBox(height: 4),
              desc != ""
                  ? Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: kDefaultFontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kNeutral60,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
