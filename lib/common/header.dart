import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bio/repository/projects_repository.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final void Function(int) onActionTap;

  const Header({required this.onActionTap, Key? key}) : super(key: key);

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          TextButton(
            onPressed: () {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.info,
                text: "Elijah's Gichev project overview page!",
              );
            },
            child: Text(
              "Elijah Gichev",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: () {
                _launchInWebViewOrVC('https://vk.com/mr_gichebs');
              },
              icon: SvgPicture.asset(
                'icons/vk.svg',
                color: Colors.black,
                semanticsLabel: 'VK',
              ),
            ),
          ),
        ],
      ),
      actions: [
        ...List.generate(
          ProjectRepository.projects.length,
          (index) {
            final projectView = ProjectRepository.projects[index];
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 1.w,
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
