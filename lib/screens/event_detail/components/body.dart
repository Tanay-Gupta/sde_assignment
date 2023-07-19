import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  String iconLink;
  String eventTitle;
  String city;
  String country;
  String venue;
  String date;
  String banner;
  String desc;
  // ignore: non_constant_identifier_names
  String organiser_name;
  Body(
      {super.key,
      required this.iconLink,
      required this.desc,
      required this.eventTitle,
      required this.city,
      required this.country,
      required this.organiser_name,
      required this.venue,
      required this.banner,
      required this.date});

  @override
  Widget build(BuildContext context) {
    //never use expandable inside stack
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            appbar(banner),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 313,
                      child: Text(
                        eventTitle,
                        style: const TextStyle(
                          color: Color(0xFF110C26),
                          fontSize: 35,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    helper(iconLink, organiser_name, "Organizer", 0),
                    helper("assets/icons/Date.svg", dateExtractor(date, 0),
                        dateExtractor(date, 1), 1),
                    helper("assets/icons/Location.svg", venue,
                        "$city, $country", 1),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'About Event',
                      style: TextStyle(
                        color: Color(0xFF110C26),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                        child: ExpandableText(
                      desc,
                      style: const TextStyle(
                        color: Color(0xFF110C26),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      expandText: "show more",
                      maxLines: 5,
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: [Colors.white.withOpacity(0), Colors.white],
                ),
              ),
              child: Center(
                child: Container(
                  height: 60,
                  width: 271,
                  decoration: BoxDecoration(
                      color: Color(0xff5669FF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'BOOK NOW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SvgPicture.asset("assets/icons/arrowblue.svg"),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

SliverAppBar appbar(String banner) {
  return SliverAppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Event Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              "assets/icons/Fav.svg",
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black,
    expandedHeight: 180,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
        background: Hero(
      tag: banner,
      child: CachedNetworkImage(
          imageUrl: banner, width: double.maxFinite, fit: BoxFit.cover),
    )),
  );
}

Widget helper(String icon, String title, String subtitle, int network) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: [
          network == 0
              ? (icon.endsWith(".svg") == false
                  ? Image.network(
                      icon,
                      height: 48,
                      width: 48,
                    )
                  : SvgPicture.network(
                      icon,
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ))
              : SvgPicture.asset(
                  icon,
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF747688),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

String dateExtractor(String date_time, int flag) {
  List weekday = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  DateTime dateTime = DateTime.parse(date_time);

  String day = weekday[dateTime.weekday - 1];

  int date = dateTime.day;
  String month = months[dateTime.month - 1];
  int year = dateTime.year;
  String time = DateFormat('h:mm a').format(dateTime);

  if (flag == 0) {
    return '$date $month $year';
  } else {
    return '$day, $time';
  }
}
