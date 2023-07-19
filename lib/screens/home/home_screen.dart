import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sde_assignment/logic/cubits/event_cubit/event_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sde_assignment/screens/event_detail/detail_screen.dart';
import 'package:sde_assignment/screens/home/event_container.dart';

import 'package:sde_assignment/screens/search/search_screen.dart';
import 'package:sde_assignment/values.dart';

import '../../logic/cubits/event_cubit/event_state.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: detailsAppBar(context),
        body: SafeArea(child:
            BlocBuilder<EventCubit, EventState>(builder: (context, state) {
          if (state is EventLoadingState) {
            return Center(
              child: Lottie.asset(loadingAnimation, height: 200, width: 200),
            );
          }

          if (state is EventLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        return EventContainer(
                          voidCallback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          desc: state.events[index].description
                                              .toString(),
                                          organiser_name: state
                                              .events[index].organiserName
                                              .toString(),
                                          banner: state
                                              .events[index].bannerImage
                                              .toString(),
                                          iconLink: state
                                              .events[index].organiserIcon
                                              .toString(),
                                          date: state.events[index].dateTime
                                              .toString(),
                                          city: state.events[index].venueCity
                                              .toString(),
                                          venue: state.events[index].venueName
                                              .toString(),
                                          country: state
                                              .events[index].venueCountry
                                              .toString(),
                                          eventTitle: state.events[index].title
                                              .toString(),
                                        )));
                          },
                          date: state.events[index].dateTime.toString(),
                          city: state.events[index].venueCity.toString(),
                          venue: state.events[index].venueName.toString(),
                          country: state.events[index].venueCountry.toString(),
                          eventTitle: state.events[index].title.toString(),
                          iconLink: state.events[index].bannerImage.toString(),
                        );
                      }),
                ),
              ],
            );
          }

          return Center(
            child: Lottie.asset(errorAnimation, height: 200, width: 200),
          );
        })));
  }
}

AppBar detailsAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: const Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      child: Text(
        'Events',
        style: TextStyle(
          color: primarycolor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    actions: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
        },
        child: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset(
            "assets/icons/search.svg",
          ),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
      InkWell(
        onTap: () {},
        child: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset(
            "assets/icons/more-vertical.svg",
          ),
        ),
      ),
      const SizedBox(
        width: 25,
      ),
    ],
  );
}
