import 'package:contract_foundry_landing_page/config.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        const Expanded(child: SizedBox()),
        IconButton.outlined(
            onPressed: () async {
              await launchUrlString(Links.blueskyLink);
            },
            icon: Iconify(
              Ph.butterfly_fill,
              color: Colors.white,
            )),
            icon: Iconify(
              Carbon.logo_linkedin,
              color: Colors.white,
            )),
        IconButton.outlined(
            onPressed: () async {
              await launchUrlString(Links.telegramChannelLink);
            },
            icon: Iconify(
              Mdi.telegram,
              color: Colors.white,
            )),
        IconButton.outlined(
            onPressed: () async {
              await launchUrlString(Links.xLink);
            },
            icon: Iconify(
              Carbon.logo_twitter,
              color: Colors.white,
            )),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
