import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          fillColor: Colors.deepPurple,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          suffix: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding*0.75),
              margin: EdgeInsets.symmetric(
                  horizontal: defaultPadding/2
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SvgPicture.asset("images/search.svg"),
            ),
          ),
        ),
      ),
    );
  }
}
