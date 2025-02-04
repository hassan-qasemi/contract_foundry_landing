import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/landing_page_view/contact_me_button.dart';
import 'package:contract_foundry_landing_page/landing_page_view/social_links_widget.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'copyright_widget.dart';

class LandingPageMobile extends StatelessWidget {
  const LandingPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Contract Foundry',
          style: context.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [ContactMeButton()],
      ),
      body: Stack(
        children: [
          GlassmorphismBackground(isDarkMode: true),
          Center(
            child: Container(
              height: h,
              width: w,
              padding: EdgeInsets.all(w * .01),
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Wrap(
                    children: [
                      Text(
                        'Trustless Digital Interaction',
                        textAlign: TextAlign.center,
                        style: context.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * .2),
                      child: Wrap(
                        children: [
                          Text(
                              'Decentralized Secure business interactions by Blockchain Powered Self Sovereigh Identites and SLC\'s',
                              textAlign: TextAlign.center,
                              style: context.bodyLarge!
                                  .copyWith(color: context.primaryColor))
                        ],
                      )),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(child: SizedBox()),
                      TextButton(
                          onPressed: () async {
                            await launchUrlString(Links.whitePaperLink);
                          },
                          child: Text(
                            'Get White paper',
                            style: context.bodyMedium!
                                .copyWith(color: Colors.white),
                          )),
                      SizedBox(
                        width: 4,
                      ),
                      FilledButton.tonal(
                          onPressed: () async {
                            await launchUrlString(Links.waitlistLink);
                          },
                          child: Text('Join Wait list')),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const Expanded(child: SizedBox(), flex: 2),
                  const CopyrightWidget(),
                  const SizedBox(height: 20),
                  const SocialLinksWidget(),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
