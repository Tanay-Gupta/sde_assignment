import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sde_assignment/data/models/all_event_model.dart';
import 'package:sde_assignment/screens/search/components/eventbox.dart';

import '../../../logic/cubits/event_cubit/event_cubit.dart';
import '../../../logic/cubits/event_cubit/event_state.dart';
import '../../../values.dart';
import '../../event_detail/detail_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = TextEditingController();
  List<AllEventModel> _searchResult = [];
  List<AllEventModel> _userdata = [];

  @override
  void initState() {
    super.initState();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<EventCubit, EventState>(builder: (context, state) {
      if (state is EventLoadingState) {
        return Center(
          child: Lottie.asset(loadingAnimation, height: 200, width: 200),
        );
      }

      if (state is EventLoadedState) {
        _userdata = state.events;
        return Column(
          children: [
            appbar(),
            listOfdata(),
          ],
        );
      }

      return Center(
        child: Lottie.asset(errorAnimation, height: 200, width: 200),
      );
    }));
  }

  onSearchTextChanged(String text) async {
    text = text.toLowerCase();
    _searchResult.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userdata.forEach((element) {
      if (element.title!.toLowerCase().contains(text) ||
          element.description!.toLowerCase().contains(text) ||
          element.organiserName!.toLowerCase().contains(text)) {
        _searchResult.add(element);
      }
    });

    setState(() {});
  }

  listOfdata() {
    return Expanded(
      child: _searchResult.isEmpty && controller.text.isEmpty
          ? ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: _userdata.length,
              itemBuilder: (context, index) {
                return SearchEventContainer(
                  voidCallback: () {
                    pushToDetail(_userdata, index);
                  },
                  date: _userdata[index].dateTime.toString(),
                  city: _userdata[index].venueCity.toString(),
                  venue: _userdata[index].venueName.toString(),
                  country: _userdata[index].venueCountry.toString(),
                  eventTitle: _userdata[index].title.toString(),
                  iconLink: _userdata[index].bannerImage.toString(),
                );
              })
          : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                return SearchEventContainer(
                  voidCallback: () {
                    pushToDetail(_searchResult, index);
                  },
                  date: _searchResult[index].dateTime.toString(),
                  city: _searchResult[index].venueCity.toString(),
                  venue: _searchResult[index].venueName.toString(),
                  country: _searchResult[index].venueCountry.toString(),
                  eventTitle: _searchResult[index].title.toString(),
                  iconLink: _searchResult[index].bannerImage.toString(),
                );
              }),
    );
  }

  pushToDetail(List list, int index) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  desc: list[index].description.toString(),
                  organiser_name: list[index].organiserName.toString(),
                  banner: list[index].bannerImage.toString(),
                  iconLink: list[index].organiserIcon.toString(),
                  date: list[index].dateTime.toString(),
                  city: list[index].venueCity.toString(),
                  venue: list[index].venueName.toString(),
                  country: list[index].venueCountry.toString(),
                  eventTitle: list[index].title.toString(),
                )));
  }

  appbar() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/search1.svg",
              width: 30,
              height: 30,
            ),
            const VerticalDivider(
              color: Color(0xFF7974E7),
              indent: 7,
              thickness: 2,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: TextField(
                controller: controller,
                onChanged: onSearchTextChanged,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: 'Type Event Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
