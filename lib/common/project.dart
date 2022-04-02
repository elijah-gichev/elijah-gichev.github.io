import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bio/models/project.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final Color backgroundColor;

  const ProjectItem({required this.project, required this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 50),
            width: 50.w,
            child: Container(
              color: backgroundColor,
              alignment: Alignment.center,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    project.title,
                    curve: Curves.easeOut,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 62,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: 50.w,
            child: Container(
              child: Center(
                child: Text(
                  project.description,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
