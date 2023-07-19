import 'package:flutter/material.dart';
import 'components/body.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  String iconLink;
  String eventTitle;
  String city;
  String country;
  String venue;
  String date;
  String banner;
  String desc;
  String organiser_name;

  DetailsScreen(
      {super.key,
      required this.iconLink,
      required this.desc,
      required this.eventTitle,
      required this.city,
      required this.country,
      required this.venue,
      required this.organiser_name,
      required this.banner,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(
        desc: desc,
        organiser_name: organiser_name,
        banner: banner,
        city: city,
        iconLink: iconLink,
        eventTitle: eventTitle,
        country: country,
        venue: venue,
        date: date,
      ),
    );
  }
}
