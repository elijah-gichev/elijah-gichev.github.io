import 'package:flutter/material.dart';
import 'package:flutter_bio/common/header.dart';
import 'package:flutter_bio/common/project.dart';
import 'package:flutter_bio/repository/projects_repository.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        onActionTap: _scrollToIndex,
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        children: List.generate(
          ProjectRepository.projects.length,
          (index) {
            final projectView = ProjectRepository.projects[index];
            return ProjectItem(
              project: projectView.project,
              backgroundColor: projectView.mainColor,
              toButtonColor: projectView.inverseColor,
            );
          },
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    pageController.animateToPage(index, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
