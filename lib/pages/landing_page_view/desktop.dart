import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'background.dart';
import 'about_page.dart';
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
        actions: [
          TextButton.icon(
            onPressed: () {
              context.goNamed('contract_loader_page');
            },
            label: Text('Link contract'),
            icon: const Icon(Icons.launch_outlined),
          ),
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.serviceprofLink);
              },
              child: Text(
                'Service portfolio & pricing',
              )),
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.whitePaperLink);
              },
              child: Text(
                'Get White paper',
              )),
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.documentsLink);
              },
              child: Text('Documents')),
        ],
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
    return LayoutBuilder(
        builder: (ctx, cns) => Row(children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: SizedBox()),
                            ListTile(
                                title: Wrap(
                              children: [
                                Text(
                                  'Contract Foundry',
                                  style: context.displayMedium!.copyWith(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                            const Expanded(child: SizedBox()),
                            Wrap(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Wrap(
                                      children: [
                                        Text(
                                          _description,
                                          style: context.bodyLarge!.copyWith(
                                              color: context.primaryColor),
                                        )
                                      ],
                                    )),
                                SizedBox(height: 10),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Wrap(
                                      children: [
                                        Text('Launching Soon',
                                            textAlign: TextAlign.center,
                                            style: context.bodyLarge!.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )),
                                ListTile(
                                  leading: FilledButton.tonal(
                                      onPressed: () async {
                                        await launchUrlString(
                                            Links.waitlistLink);
                                      },
                                      child: Text('Join Wait list')),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const CopyrightWidget(),
                            const SizedBox(height: 10),
                            const SocialLinksWidget(),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ))),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const Expanded(child: SizedBox()),
                        Wrap(
                          children: [
                            Text(
                              'Decentralized\nTrustless\nInteractions',
                              style: context.displayLarge!.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      (context.displayLarge!.fontSize! * 1.7)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ))
            ]));
  }
}

const _description = '''
Contract Foundry is a permissionless
decentralized platform that provides self-
sovereign identity, verifiable credentials, and
trustless smart contracts as infrastructure.

We empower users to manage their data,
verify contracts and credentials securely,
privately, and without intermediaries. Built on
blockchain and Web3 principles, our mission
is to redefine trust through automation,
transparency, and control.
''';
