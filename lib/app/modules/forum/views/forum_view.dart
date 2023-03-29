import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/forum/views/card_post_view.dart';
import 'package:hapi/app/modules/forum/views/create_forum_view.dart';
import 'package:hapi/app/modules/forum/views/detail_community_view.dart';
import 'package:hapi/app/modules/forum/views/search_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ForumController());
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        appBar: buildAppbar(size: size),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchInput(),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 20),
                      child: Text(
                        "Topik populer",
                        style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kNeutral100),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.popularTopic
                      .asMap()
                      .map(
                        (i, element) => MapEntry(
                          i,
                          Padding(
                            padding: EdgeInsets.only(
                              left: i == 0 ? 20 : 14,
                              right: (i + 1) == controller.popularTopic.length
                                  ? 20
                                  : 0,
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.getSearchPost(
                                    keyword: element['name']);
                                print(controller.searchPost.length);
                                Get.to(() => SearchView());
                              },
                              borderRadius: kDefaultBorderRadius,
                              child: Ink(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimarySurface,
                                  borderRadius: kDefaultBorderRadius,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${element['name']}",
                                      style: TextStyle(
                                          fontFamily: kDefaultFontFamily,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: kNeutral100),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "${element['count']} postingan",
                                      style: TextStyle(
                                        fontFamily: kDefaultFontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kNeutral70,
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
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 20, left: 20),
                child: Text(
                  "Komunitas untukmu",
                  style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kNeutral100,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.listCommunity
                      .asMap()
                      .map(
                        (i, element) => MapEntry(
                          i,
                          Padding(
                            padding: EdgeInsets.only(
                              left: i == 0 ? 20 : 18,
                              right: (i + 1) == controller.listCommunity.length
                                  ? 20
                                  : 0,
                            ),
                            child: InkWell(
                              borderRadius: kDefaultBorderRadius,
                              onTap: () {
                                Get.to(
                                  () => DetailCommunityView(
                                    title: element['title'],
                                    desc: element['desc'],
                                    createdAt: element['created_at'],
                                    image: element['image'],
                                    banner: element['banner'],
                                    member: element['member'],
                                    postCount: element['postCount'],
                                    topicCount: element['topicCount'],
                                  ),
                                );
                              },
                              child: Ink(
                                width: size.width * 0.65,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius,
                                  border:
                                      Border.all(width: 1, color: kNeutral40),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Ink(
                                      padding: EdgeInsets.all(14),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "$kDefaultImagePath/${element['image']}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      "${element['title']}",
                                      style: TextStyle(
                                          fontFamily: kDefaultFontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kNeutral100),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "${element['desc']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: kDefaultFontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: kNeutral70),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            HeroIcon(
                                              HeroIcons.userGroup,
                                              style: HeroIconStyle.solid,
                                              color: kNeutral70,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "${element['member']} Anggota",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      kDefaultFontFamily,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: kNeutral70),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            HeroIcon(
                                              HeroIcons.chatBubbleLeftRight,
                                              style: HeroIconStyle.mini,
                                              color: kNeutral70,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "${element['postCount']} Postingan",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      kDefaultFontFamily,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: kNeutral70),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
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
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 20, left: 20),
                child: Row(
                  children: [
                    Text(
                      "Post terhangat",
                      style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kNeutral100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: HeroIcon(
                        HeroIcons.fire,
                        style: HeroIconStyle.mini,
                        color: kWarningMain,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      ),
    );
  }

  AppBar buildAppbar({required Size size}) {
    return AppBar(
      backgroundColor: kNeutral10,
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: size.width * 0.65,
      leading: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forum Diskusi dan Komunitas",
              style: TextStyle(
                color: kNeutral70,
                fontFamily: kDefaultFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Bertanya dan berbagi",
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
      actions: [
        Row(
          children: [
            Container(
              width: 64,
              height: 64,
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => CreateForumView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kNeutral10,
                  elevation: 0,
                  shape: kDefaultButtonShapeWithBorder,
                  padding: EdgeInsets.zero,
                ),
                child: HeroIcon(
                  HeroIcons.plus,
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

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final controller = Get.put(ForumController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 52,
      child: TextField(
        controller: searchController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: kNeutral20,
          hintText: "Cari kata kunci atau komunitas",
          contentPadding: EdgeInsets.only(left: 20),
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
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                controller.getSearchPost(keyword: searchController.text);
                Get.to(() => SearchView());
              },
              child: HeroIcon(
                HeroIcons.magnifyingGlass,
                style: HeroIconStyle.outline,
                color: kNeutral70,
                size: 20,
              ),
            ),
          ),
        ),
        onEditingComplete: () {
          controller.getSearchPost(keyword: searchController.text);
          Get.to(() => SearchView());
        },
      ),
    );
  }
}
