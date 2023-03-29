import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hapi/app/modules/calendar/views/create_report_view.dart';
import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kNeutral10,
      appBar: buildAppbar(size: size),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        var currentDate = controller.selectedDate.value;
                        controller.selectedYear.value = currentDate.year;
                        controller.selectedMonth.value = currentDate.month - 1;
                        Get.dialog(
                          buildYearDialog(),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              "${controller.months[(controller.selectedDate.value.month - 1)]} ${controller.selectedDate.value.year}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: kDefaultFontFamily,
                                color: kNeutral100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 6),
                              child: HeroIcon(
                                HeroIcons.chevronDown,
                                style: HeroIconStyle.mini,
                                color: kNeutral100,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 20,
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 7,
                        crossAxisSpacing: 10,
                        children: controller.days.map(
                          (e) {
                            var currentDay = DateFormat('EEEE', 'id_ID')
                                .format(controller.selectedDate.value);
                            var isSelectedDay = e == currentDay;
                            return Text(
                              e.substring(0, 3),
                              style: TextStyle(
                                fontFamily: kDefaultFontFamily,
                                fontSize: 14,
                                fontWeight: isSelectedDay
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                color:
                                    isSelectedDay ? kPrimaryMain : kNeutral80,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    AnimatedContainer(
                      margin: EdgeInsets.only(top: 10),
                      duration: Duration(milliseconds: 300),
                      height: controller.weekOption.value ? 94 : 254,
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 7,
                        crossAxisSpacing: 10,
                        childAspectRatio:
                            controller.weekOption.value ? 0.45 : 1,
                        children: controller.listDate
                            .map(
                              (e) => controller.weekOption.value
                                  ? Column(
                                      children: [
                                        buildCalenderItem(
                                          date: e['date'],
                                          emoji: e['emoji'],
                                          isSelected: e['isSelected'],
                                          isCurrentMonth: e['isCurrentMonth'],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          height: 34,
                                          width: 34,
                                          // color: Colors.amber,
                                          child: e['emoji'] != ""
                                              ? Image.asset(
                                                  "$kDefaultIconPath/${e['emoji']}.png")
                                              : null,
                                        ),
                                      ],
                                    )
                                  : buildCalenderItem(
                                      date: e['date'],
                                      emoji: e['emoji'],
                                      isSelected: e['isSelected'],
                                      isCurrentMonth: e['isCurrentMonth'],
                                    ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: kNeutral40,
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: size.width,
                      height: 174,
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
                                    text: "Pada tanggal yang dipilih",
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
                        onPressed: () {
                          Get.to(() => CreateReportView());
                        },
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
            ],
          ),
        ),
      ),
    );
  }

  Container buildCalenderItem(
      {required int date,
      required String emoji,
      required bool isSelected,
      required bool isCurrentMonth}) {
    return Container(
      child: InkWell(
        borderRadius: kDefaultBorderRadius,
        onTap: () {
          if (isCurrentMonth) {
            var currentDate = controller.selectedDate.value;
            controller.selectedDate.value =
                DateTime(currentDate.year, currentDate.month, date);
            controller.changeSelectedDay();
          }
        },
        child: Ink(
          width: controller.weekOption.value ? 42 : 40,
          height: controller.weekOption.value ? 42 : 40,
          decoration: isSelected
              ? BoxDecoration(
                  color: kPrimarySurface,
                  borderRadius: kDefaultBorderRadius,
                )
              : BoxDecoration(
                  color: Colors.transparent,
                ),
          child: Center(
            child: (controller.weekOption.value) || (emoji == "")
                ? Text(
                    "$date",
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: isCurrentMonth ? 22 : 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? kPrimaryMain
                          : isCurrentMonth
                              ? kNeutral80
                              : kNeutral50,
                    ),
                  )
                : Container(
                    height: 34,
                    width: 34,
                    child: Image.asset("$kDefaultIconPath/$emoji.png"),
                  ),
          ),
        ),
      ),
    );
  }

  AlertDialog buildYearDialog() {
    return AlertDialog(
      shape: kDefaultButtonShape,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                HeroIcons.chevronLeft,
                style: HeroIconStyle.outline,
                color: kNeutral80,
                size: 20,
              ),
            ),
          ),
          Text(
            "Pilih Tahun",
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
                HeroIcons.chevronRight,
                style: HeroIconStyle.outline,
                color: kNeutral80,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      content: Container(
        width: 280,
        height: 300,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 280,
                height: 240,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 2 / 1.3,
                  children: controller.years.sublist(12, 24).map(
                    (e) {
                      var isSelected = e == controller.selectedYear.value;
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            controller.selectedYear.value = e;
                          },
                          borderRadius: kDefaultBorderRadius,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: kDefaultBorderRadius,
                              color: isSelected
                                  ? kPrimarySurface
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "$e",
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  color: isSelected ? kPrimaryMain : kNeutral90,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimarySurface,
                        elevation: 0,
                        shape: kDefaultButtonShape,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryMain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.dialog(
                          buildMonthDialog(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryMain,
                        elevation: 0,
                        shape: kDefaultButtonShape,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kNeutral10,
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

  AlertDialog buildMonthDialog() {
    return AlertDialog(
      shape: kDefaultButtonShape,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                controller.selectedYear.value =
                    controller.selectedYear.value - 1;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kNeutral10,
                elevation: 0,
                shape: kDefaultButtonShapeWithBorder,
                padding: EdgeInsets.zero,
              ),
              child: HeroIcon(
                HeroIcons.chevronLeft,
                style: HeroIconStyle.outline,
                color: kNeutral80,
                size: 20,
              ),
            ),
          ),
          Obx(
            () => Text(
              "${controller.selectedYear.value}",
              style: TextStyle(
                fontFamily: kDefaultFontFamily,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: kNeutral100,
              ),
            ),
          ),
          Container(
            width: 44,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                controller.selectedYear.value =
                    controller.selectedYear.value + 1;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kNeutral10,
                elevation: 0,
                shape: kDefaultButtonShapeWithBorder,
                padding: EdgeInsets.zero,
              ),
              child: HeroIcon(
                HeroIcons.chevronRight,
                style: HeroIconStyle.outline,
                color: kNeutral80,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      content: Container(
        width: 280,
        height: 300,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 280,
                height: 240,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 2 / 1.3,
                  children: controller.months.map(
                    (e) {
                      var isSelected = e ==
                          controller.months[controller.selectedMonth.value];
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            controller.selectedMonth.value =
                                controller.months.indexOf(e);
                          },
                          borderRadius: kDefaultBorderRadius,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: kDefaultBorderRadius,
                              color: isSelected
                                  ? kPrimarySurface
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                e.substring(0, 3),
                                style: TextStyle(
                                  fontFamily: kDefaultFontFamily,
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  color: isSelected ? kPrimaryMain : kNeutral90,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.dialog(buildYearDialog());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimarySurface,
                        elevation: 0,
                        shape: kDefaultButtonShape,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryMain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        var currentDate = controller.selectedDate.value;
                        controller.selectedDate.value = DateTime(
                            controller.selectedYear.value,
                            (controller.selectedMonth.value + 1),
                            currentDate.day);
                        controller.weekOption.value
                            ? controller.generateWeekDates()
                            : controller.generateMonthDates();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryMain,
                        elevation: 0,
                        shape: kDefaultButtonShape,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                          fontFamily: kDefaultFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kNeutral10,
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
    final controller = Get.put(CalendarController());
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
              "Mood Kalendar",
              style: TextStyle(
                color: kNeutral70,
                fontFamily: kDefaultFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Mari catat mood mu!",
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
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  controller.changeCalenderOption();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kNeutral10,
                  elevation: 0,
                  shape: kDefaultButtonShapeWithBorder,
                  padding: EdgeInsets.zero,
                ),
                child: HeroIcon(
                  HeroIcons.calendarDays,
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
                onPressed: () {
                  Get.to(() => CreateReportView());
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
