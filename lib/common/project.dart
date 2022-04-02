import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bio/models/project.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final Color backgroundColor;
  final Color toButtonColor;

  final _scrollController = ScrollController();

  ProjectItem({
    required this.project,
    required this.backgroundColor,
    required this.toButtonColor,
    Key? key,
  }) : super(key: key);

  Future<void> _scrollBeginToEnd() async {
    await _scrollController.animateTo(
      80.w,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Future<void> _scrollEndToBegin() async {
    await _scrollController.animateTo(
      -80.w,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      height: 20.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        children: <Widget>[
          Container(
            width: 80.w,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          project.title,
                          curve: Curves.easeOut,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 60,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 1.w,
                    bottom: 1.w,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: toButtonColor),
                      onPressed: () {
                        _scrollBeginToEnd();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: 50.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Center(
                child: Text(
                  project.description,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            width: 50.w,
            child: Stack(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      ...List.generate(
                        project.features.length,
                        (index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Center(
                              child: Text(
                                project.features[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 1.w,
                  bottom: 1.w,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: toButtonColor),
                    onPressed: () {
                      _scrollEndToBegin();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
