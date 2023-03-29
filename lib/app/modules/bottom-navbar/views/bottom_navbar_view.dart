import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/calendar/views/calendar_view.dart';
import 'package:hapi/app/modules/forum/views/forum_view.dart';
import 'package:hapi/app/modules/home/views/home_view.dart';
import 'package:hapi/app/modules/user/views/user_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutral10,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedMenu.value,
          children: [
            HomeView(),
            CalendarView(),
            ForumView(),
            UserView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        height: 76,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: kNeutral50, width: 1)),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavbarItem(
                  index: 0, icons: HeroIcons.home, title: "Beranda"),
              buildNavbarItem(
                  index: 1, icons: HeroIcons.calendar, title: "Kalender"),
              Container(
                width: 44,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryMain,
                    shape: kDefaultButtonShape,
                    padding: EdgeInsets.zero,
                  ),
                  child: HeroIcon(
                    HeroIcons.plus,
                    color: kNeutral10,
                    style: HeroIconStyle.outline,
                    size: 24,
                  ),
                ),
              ),
              buildNavbarItem(
                  index: 2,
                  icons: HeroIcons.chatBubbleLeftRight,
                  title: "Forum"),
              buildNavbarItem(index: 3, icons: HeroIcons.user, title: "Profil"),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildNavbarItem(
      {required int index, required HeroIcons icons, required String title}) {
    bool isSelected = controller.selectedMenu.value == index;
    return GestureDetector(
      onTap: () {
        controller.selectedMenu.value = index;
      },
      child: Container(
        height: 44,
        width: 54,
        child: Column(
          children: [
            HeroIcon(
              icons,
              color: isSelected ? kPrimaryMain : kNeutral70,
              style: isSelected ? HeroIconStyle.solid : HeroIconStyle.outline,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: kDefaultFontFamily,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? kPrimaryMain : kNeutral70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
