import 'package:flutter/material.dart';
import 'package:flutter_bio/repository/projects_repository.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final void Function(int) onActionTap;

  const Header({required this.onActionTap, Key? key}) : super(key: key);

  // Future<void> _launchInWebViewOrVC(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: true,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        ...List.generate(
          ProjectRepository.projects.length,
          (index) {
            final projectView = ProjectRepository.projects[index];
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  projectView.project.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  onActionTap(index);
                },
              ),
            );
          },
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
