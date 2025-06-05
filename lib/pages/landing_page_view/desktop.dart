import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'background.dart';
import 'contact_me_button.dart';
import 'copyright_widget.dart';
import 'social_links_widget.dart';

class LandingPageDesktop extends StatelessWidget {
  const LandingPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Contract Foundry',
          style: context.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GlassmorphismBackground(isDarkMode: true),
          PageView(
            scrollDirection: Axis.vertical,
            children: [_HeadPage(), AboutPage()],
          )
        ],
      ),
    );
  }
}

class _HeadPage extends StatelessWidget {
  const _HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final dw = MediaQuery.of(context).size.width;
    final w = dw * .6;

    return Row(children: [
      const Expanded(child: SizedBox()),
      Center(
          child: Container(
        height: h,
        width: w,
        color: Colors.transparent,
        padding: EdgeInsets.all(w * .01),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Wrap(
              children: [
                Text(
                  'Decentralized Trustless Interactions',
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
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .2),
                child: Wrap(
                  children: [
                    Text('Launching Soon',
                        textAlign: TextAlign.center,
                        style: context.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                )),
            // SizedBox(height: 20),
            // ContractLinkerSearchBar(),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: SizedBox()),
                FilledButton.tonal(
                    onPressed: () async {
                      await launchUrlString(Links.waitlistLink);
                    },
                    child: Text('Join Wait list')),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 20),
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
                    )),
                SizedBox(
                  width: 4,
                ),
                TextButton(
                    onPressed: () async {
                      await launchUrlString(Links.documentsLink);
                    },
                    child: Text('Documents')),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: SizedBox()),
                TextButton(
                    onPressed: () async {
                      await launchUrlString(Links.serviceprofLink);
                    },
                    child: Text(
                      'Service portfolio & pricing',
                      style: context.bodyMedium!.copyWith(color: Colors.white),
                    )),
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
      )),
      const Expanded(child: SizedBox()),
    ]);
  }
}
