import 'package:flutter/material.dart';
import 'package:flutter_bio/pages/main_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examples of completed projects',
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MainPage(title: 'Elijah\'s projects overview');
        },
      ),
    );
  }
}
