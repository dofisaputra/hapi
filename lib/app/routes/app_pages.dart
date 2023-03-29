import 'package:get/get.dart';

import 'package:hapi/app/modules/article/bindings/article_binding.dart';
import 'package:hapi/app/modules/article/views/article_view.dart';
import 'package:hapi/app/modules/bottom-navbar/bindings/bottom_navbar_binding.dart';
import 'package:hapi/app/modules/bottom-navbar/views/bottom_navbar_view.dart';
import 'package:hapi/app/modules/calendar/bindings/calendar_binding.dart';
import 'package:hapi/app/modules/calendar/views/calendar_view.dart';
import 'package:hapi/app/modules/consultation/bindings/consultation_binding.dart';
import 'package:hapi/app/modules/consultation/views/consultation_view.dart';
import 'package:hapi/app/modules/forum/bindings/forum_binding.dart';
import 'package:hapi/app/modules/forum/views/forum_view.dart';
import 'package:hapi/app/modules/home/bindings/home_binding.dart';
import 'package:hapi/app/modules/home/views/home_view.dart';
import 'package:hapi/app/modules/user/bindings/user_binding.dart';
import 'package:hapi/app/modules/user/views/user_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVBAR,
      page: () => BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => ConsultationView(),
      binding: ConsultationBinding(),
    ),
  ];
}
