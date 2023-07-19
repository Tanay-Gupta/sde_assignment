import 'package:flutter/material.dart';
import 'package:sde_assignment/screens/search/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.black, //change your color here
        ),
        centerTitle: false,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
