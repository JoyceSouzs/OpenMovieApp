import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_app/features/movie_list/movie_list.dart';

import 'onboarding_page.dart';

class OnboardingPage extends StatelessWidget {
  final PageController controller = PageController();
  List<Widget> dataSource = [];

  OnboardingPage() {
    dataSource = [
      OnboardingPageChild(
          model: OnboardingPageChildModel(
              mainTitle: "Open Movie App",
              secondaryTitle: "The best App for movie information",
              imageName: "resources/images/LordOfTheRings.jpg",
              shouldPresentButton: true,
              buttonTitle: "Get Start Now!!!",
              onButtonPressed: (context) {
                _presentMovieListPage(context: context);
              })),
    ];
  }

  _presentMovieListPage({BuildContext context}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: PageView(
      children: dataSource,
    )));
  }

 
}
