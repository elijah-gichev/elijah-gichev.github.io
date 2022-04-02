import 'package:flutter/material.dart';
import 'package:flutter_bio/models/project.dart';
import 'package:flutter_bio/models/project_view.dart';

class ProjectRepository {
  static List<ProjectView> projects = [
    ProjectView(
      project: Project(
        title: "Pet911",
        description: "Приложение для поиска домашних животных",
        features: [],
      ),
      mainColor: Colors.lightGreen,
    ),
    ProjectView(
      project: Project(
        title: "Watts battery",
        description: "Приложение для связи с модулем контроля электроптания",
        features: [],
      ),
      mainColor: Colors.yellow,
    ),
    ProjectView(
      project: Project(
        title: "KurganApp",
        description: "Приложение туризма по Курганской области",
        features: [],
      ),
      mainColor: Colors.indigoAccent,
    ),
    ProjectView(
      project: Project(
        title: "Good Buy",
        description: "Приложение для жизни",
        features: [],
      ),
      mainColor: Colors.white60,
    ),
  ];
}
