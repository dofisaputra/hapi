import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/home/views/card_article_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kNeutral10,
        appBar: buildAppbar(size),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchInput(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 14,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Rekomendari buat kamu",
                  style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 14,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Rekomendari video kamu tonton",
                  style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardArticleView(
                      image: "$kDefaultImagePath/video1.png",
                      title: "Cara membuka pintu hati kepada orang lain",
                      desc: "",
                      isFirst: true,
                      isLast: false,
                    ),
                    CardArticleView(
                      image: "$kDefaultImagePath/video2.png",
                      title: "Pasangan anda adalah cerminan diri anda",
                      desc: "",
                      isFirst: false,
                      isLast: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 14,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Artikel Terbaru",
                  style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.15,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  children: [
                    buildNewArticle(
                      image: "$kDefaultImagePath/article3.png",
                      title: "Menyanyi ternyata bikin kamu tenang!",
                      desc:
                          "Berikut ini tips bagi kalian yang ingin menenangkan pikiran...",
                    ),
                    buildNewArticle(
                      image: "$kDefaultImagePath/article4.png",
                      title: "Lelah pikiran? Lakukan ini agar anda nyaman!",
                      desc: "Bagi kamu yang sedang merasa lelah akan kehi....",
                    ),
                    buildNewArticle(
                      image: "$kDefaultImagePath/article5.png",
                      title: "Tempat liburan untuk healing kamu",
                      desc:
                          "Berikut ini tips bagi kalian yang ingin menenangkan pikiran...",
                    ),
                    buildNewArticle(
                      image: "$kDefaultImagePath/article6.png",
                      title: "Tipe - tipe sifat orang yang banyak ditemui",
                      desc: "Bagi kamu yang sedang merasa lelah akan kehi....",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildNewArticle(
      {required String image, required String title, required String desc}) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 96,
              decoration: BoxDecoration(
                borderRadius: kDefaultBorderRadius,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
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
            Text(
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
          ],
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
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Artikel dan Tips',
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

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final controller = Get.put(ArticleController());
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
          hintText: "Cari artikel",
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
              onTap: () {},
              child: HeroIcon(
                HeroIcons.magnifyingGlass,
                style: HeroIconStyle.outline,
                color: kNeutral70,
                size: 20,
              ),
            ),
          ),
        ),
        onEditingComplete: () {},
      ),
    );
  }
}
