import 'package:flutter/material.dart';
import 'package:flutter_bio/models/project.dart';

class ProjectView {
  final Project project;
  final Color mainColor;
  final Color inverseColor;

  ProjectView({
    required this.project,
    required this.mainColor,
    required this.inverseColor,
  });
}
