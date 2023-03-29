import 'package:flutter/material.dart';

import 'package:hapi/constants.dart';
import 'package:heroicons/heroicons.dart';

class CardHistoryView extends StatelessWidget {
  const CardHistoryView({
    super.key,
    required this.size,
    required this.date,
    required this.userImage,
    required this.name,
    required this.status,
  });

  final Size size;
  final String date;
  final String userImage;
  final String name;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24),
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kPrimaryBorder),
        borderRadius: kDefaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Waktu janji temu",
            style: TextStyle(
              fontFamily: kDefaultFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kNeutral80,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              HeroIcon(
                HeroIcons.clock,
                color: kNeutral80,
                style: HeroIconStyle.outline,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                date,
                style: TextStyle(
                  fontFamily: kDefaultFontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kNeutral100,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: kNeutral40, thickness: 1),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kNeutral100,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kNeutral70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: size.width,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: kDefaultButtonShape,
                backgroundColor: kPrimarySurface,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                "Lihat",
                style: TextStyle(
                  fontFamily: kDefaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryMain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
