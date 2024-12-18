import 'package:flutter/material.dart';
import 'tell_about_finish_button.dart';
import 'tell_about_header.dart';
import 'tell_about_view_select_age.dart';
import 'tell_about_view_select_type.dart';

class TellAboutViewBody extends StatelessWidget {
  const TellAboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        TellAboutHeader(),
        SizedBox(height: 30),
        TellAboutViewSelectType(),
        SizedBox(height: 80),
        TellAboutViewSelectAge(),
        Spacer(),
        TellAboutFinshButton(),
      ],
    );
  }
}

