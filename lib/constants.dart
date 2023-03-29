import 'package:flutter/material.dart';

const kPrimaryMain = Color(0XFF24569F);
const kPrimarySurface = Color(0XFFEAEEF6);
const kPrimaryBorder = Color(0XFFB6C0E2);
const kPrimaryHover = Color(0XFF163D74);
const kPrimaryPressed = Color(0XFF122B4F);
var kPrimaryFocus = kPrimaryMain.withOpacity(0.2);

const kDangerMain = Color(0XFFCB3A31);
const kDangerSurface = Color(0XFFFFF4F2);
const kDangerBorder = Color(0XFFEEB4B0);
const kDangerHover = Color(0XFFBD251C);
const kDangerPressed = Color(0XFF731912);

const kWarningMain = Color(0XFFCD7B2E);
const kWarningSurface = Color(0XFFFFF9F2);
const kWarningBorder = Color(0XFFEECEB0);
const kWarningHover = Color(0XFFAB6626);
const kWarningPressed = Color(0XFF734011);

const kSuccessMain = Color(0XFF43936C);
const kSuccessSurface = Color(0XFFF7F7F7);
const kSuccessBorder = Color(0XFFB8DBCA);
const kSuccessHover = Color(0XFF367A59);
const kSuccessPressed = Color(0XFF20573D);

const kInfoMain = Color(0XFF3267E3);
const kInfoSurface = Color(0XFFF0F3FF);
const kInfoBorder = Color(0XFFB1C5F6);
const kInfoHover = Color(0XFF114CD6);
const kInfoPressed = Color(0XFF11317D);

const kSecondaryMain = Color(0XFFE2327D);
const kSecondarySurface = Color(0XFFFBE9F2);
const kSecondaryBorder = Color(0XFFF5BCD5);
const kSecondaryHover = Color(0XFFAB265F);
const kSecondaryPressed = Color(0XFF641637);
const kSecondaryFocus = Color(0XFFF4D1E0);

const kNeutral10 = Color(0XFFFFFFFF);
const kNeutral20 = Color(0XFFF5F5F5);
const kNeutral30 = Color(0XFFEDEDED);
const kNeutral40 = Color(0XFFE0E0E0);
const kNeutral50 = Color(0XFFC2C2C2);
const kNeutral60 = Color(0XFF9E9E9E);
const kNeutral70 = Color(0XFF757575);
const kNeutral80 = Color(0XFF616161);
const kNeutral90 = Color(0XFF404040);
const kNeutral100 = Color(0XFF0A0A0A);

const kDefaultFontFamily = "PlusJakartaSans";
const kDefaultIconPath = "assets/icons";
const kDefaultImagePath = "assets/images";

const kDays = [
  "Senin",
  "Selasa",
  "Rabu",
  "Kamis",
  "Jumat",
  "Sabtu",
  "Minggu",
];
const kMonths = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember"
];
const kEmotions = [
  "Bahagia",
  "Senang",
  "Biasa Aja",
  "Khawatir",
  "Tidak Suka",
];
var kYears = List.generate(50, (index) => 2000 + index);

const kDummyDate = [
  {"date": 1, "emoji": ""},
  {"date": 2, "emoji": ""},
  {"date": 3, "emoji": "bad"},
  {"date": 4, "emoji": "good"},
  {"date": 5, "emoji": "neutral"},
  {"date": 6, "emoji": ""},
  {"date": 7, "emoji": ""},
  {"date": 8, "emoji": ""},
  {"date": 9, "emoji": "great"},
  {"date": 10, "emoji": ""},
  {"date": 11, "emoji": "awful"},
  {"date": 12, "emoji": "good"},
  {"date": 13, "emoji": "awful"},
  {"date": 14, "emoji": ""},
  {"date": 15, "emoji": ""},
  {"date": 16, "emoji": "awful"},
  {"date": 17, "emoji": "good"},
  {"date": 18, "emoji": "bad"},
  {"date": 19, "emoji": ""},
  {"date": 20, "emoji": "bad"},
  {"date": 21, "emoji": ""},
  {"date": 22, "emoji": "neutral"},
  {"date": 23, "emoji": ""},
  {"date": 24, "emoji": ""},
  {"date": 25, "emoji": "bad"},
  {"date": 26, "emoji": ""},
  {"date": 27, "emoji": "good"},
  {"date": 28, "emoji": "awful"},
  {"date": 29, "emoji": "bad"},
  {"date": 30, "emoji": ""},
  {"date": 31, "emoji": "good"}
];

const kDefaultButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
);
const kDefaultButtonShapeWithBorder = RoundedRectangleBorder(
  side: BorderSide(width: 1, color: kNeutral40),
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
);
const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(12),
);
