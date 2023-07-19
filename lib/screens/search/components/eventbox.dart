// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../values.dart';

class SearchEventContainer extends StatelessWidget {
  String iconLink;
  String eventTitle;
  String city;
  String country;
  String venue;
  String date;

  VoidCallback? voidCallback;
  SearchEventContainer(
      {super.key,
      required this.iconLink,
      required this.eventTitle,
      required this.city,
      required this.country,
      required this.venue,
      required this.date,
      this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: voidCallback,
          child: Container(
            width: 327,
            height: 106,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0F575C8A),
                  blurRadius: 35,
                  offset: Offset(0, 10),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                  child: Hero(
                    tag: iconLink,
                    child: CachedNetworkImage(
                      imageUrl: iconLink,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 92,
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Lottie.asset(
                          circularLoadingAnimation,
                          height: 60,
                          width: 60),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateExtractor(date),
                        style: const TextStyle(
                          color: Color(0xFF5668FF),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          eventTitle,
                          style: const TextStyle(
                            overflow: TextOverflow.fade,
                            color: Color(0xFF110C26),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  String dateExtractor(String date_time) {
    DateTime dateTime = DateTime.parse(date_time);
    String day = weekday[dateTime.weekday - 1].toString().toUpperCase();
    String month = months[dateTime.month - 1].toString().toUpperCase();
    String time = DateFormat('h:mm a').format(dateTime);
    // ignore: non_constant_identifier_names
    String Daysuffix = suffix[dateTime.day - 1];
    return '$Daysuffix $month- $day -$time';
  }
}
