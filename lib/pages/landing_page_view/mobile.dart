import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/about_page.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/social_links_widget.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../service_intro_pages/mobile.dart';
import 'copyright_widget.dart';

class LandingPageMobile extends StatelessWidget {
  const LandingPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          forceMaterialTransparency: true,
          elevation: 0,
          title: Text(
            'Contract Foundry',
            style: context.headlineSmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    showDragHandle: true,
                    isScrollControlled: true,
                    constraints: BoxConstraints(maxHeight: 230),
                    backgroundColor: Colors.black87,
                    builder: (c) => ListView(
                          children: [
                            ListTile(
                              title: Text('Documents'),
                              onTap: () async {
                                await launchUrlString(Links.documentsLink);
                              },
                            ),
                            ListTile(
                              title: Text('Service portfolio & pricing'),
                              onTap: () async {
                                await launchUrlString(Links.serviceprofLink);
                              },
                            ),
                            ListTile(
                              title: Text('Get White paper'),
                              onTap: () async {
                                await launchUrlString(Links.whitePaperLink);
                              },
                            ),
                            // ListTile(
                            //   leading: const Icon(Icons.launch_outlined),
                            //   title: Text('Link Contract'),
                            //   onTap: () {
                            //     context.goNamed('contract_loader_page');
                            //   },
                            // ),
                          ],
                        ));
              },
              icon: const Icon(Icons.sort))),
      body: Stack(
        children: [
          GlassmorphismBackground(isDarkMode: true),
          Center(
              child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                    child: Column(children: [
                  const Expanded(child: SizedBox()),
                  Wrap(
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              style: context.displayMedium!
                                  .copyWith(color: Colors.white70),
                              text: 'Decentralized\n'),
                          TextSpan(
                              style: context.displayLarge!
                                  .copyWith(color: Colors.white70),
                              text: 'Trustless\n'),
                          TextSpan(
                              style: context.displayMedium!
                                  .copyWith(color: Colors.white70),
                              text: 'Infrastructure')
                        ]),
                        textAlign: TextAlign.center,
                        style: context.displayLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  const CopyrightWidget(),
                  const SizedBox(
                    height: 20,
                  )
                ])),
              ),
              _HeadPage(),
              ServiceIntroCardMobileView(
                asset: Assets.docAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'OnChain Document Verification',
                description:
                    'Issue secure, tamper-proof digital qualifications with instant verification, building trust and preventing fraud effortlessly',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.paperAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'P2P Payment & Escrow',
                description:
                    'Enable risk-free transactions with automated escrow payments, funds release only when agreed conditions are met, eliminating disputes and middlemen',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.apwAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'Asset Monetization',
                description:
                    'Securely audit and monetize digital creations worldwide with blockchain-based paywalls tailored for creators and authors',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.idAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'Decentralized Identity',
                description:
                    'Take control of your digital identity with privacy-focused, decentralized IDs (ERC1056/W3C compliant) and trusted credential issuance & verification',
              ),
              ServiceIntroCardMobileView(
                  asset: Assets.credAsset,
                  h: MediaQuery.of(context).size.height,
                  w: MediaQuery.of(context).size.width,
                  title: 'Verifiable Credentials',
                  description:
                      'Issue tamper-proof wallet-first digital credentials, offering instant verification, selective disclosure, and registered credentials for maximum trust'),
              AboutPage()
            ],
          )),
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
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(w * .01),
      color: Colors.transparent,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Wrap(
                children: [
                  Text(
                    _description,
                    style: context.bodyLarge!
                        .copyWith(color: context.primaryColor),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )),
          SizedBox(height: 25),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Wrap(
                children: [
                  Text(
                      'The Contract Foundry Wallet beta will be available to users on our early access list',
                      textAlign: TextAlign.center,
                      style: context.bodySmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )),
          SizedBox(height: 9),
          // const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(child: SizedBox()),
              FilledButton.tonal(
                  onPressed: () async {
                    await launchUrlString(Links.requestBetaLink);
                  },
                  child: Text('Request Early Access')),
              const Expanded(child: SizedBox()),
            ],
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          const SizedBox(height: 20),
          const SocialLinksWidget(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  final _description =
      'Contract Foundry is a permissionless, decentralized platform offering self-sovereign identity, verifiable credentials, and enterprise-grade trustless infrastructure.\n'
      '\nWe empower users to securely manage their data and verify contracts and credentials privately, without intermediaries. Built on blockchain and Web3 principles, our mission is to redefine trust through automation, transparency, and user control.\n';

  // 'Contract Foundry is a permissionless decentralized platform that provides self-sovereign identity, verifiable credentials, and enterprise-grade trustless infrastructure.\n\nWe empower users to manage their data, verify contracts and credentials securely, privately, and without intermediaries. Built on blockchain and Web3 principles, our mission is to redefine trust through automation, transparency, and control.';

//   final _description = '''
// Contract Foundry is a permissionless
// decentralized platform that provides self-
// sovereign identity, verifiable credentials, and
// trustless smart contracts as infrastructure.

// We empower users to manage their data,
// verify contracts and credentials securely,
// privately, and without intermediaries. Built on
// blockchain and Web3 principles, our mission
// is to redefine trust through automation,
// transparency, and control.
// ''';
}
