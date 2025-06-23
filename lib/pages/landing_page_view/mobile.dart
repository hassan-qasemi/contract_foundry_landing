import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/about_page.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/social_links_widget.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                            ListTile(
                              leading: const Icon(Icons.launch_outlined),
                              title: Text('Link Contract'),
                              onTap: () {
                                context.goNamed('contract_loader_page');
                              },
                            ),
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
                      Text(
                        'Decentralized\nTrustless\nInteractions',
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
                title: 'Document Certification',
                description:
                    'On-Chain Document Cerification, automated verification and authentication, compliant signature,on-chain signature verification, immutable signature, immutable audit trails, multi signature support, expirable and revocable.',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.paperAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'P2P Payment',
                description:
                    'P2P trustless payment, fund safety, cancellable and expirable, payment rollback support, leaving contract with both side agreement.',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.apwAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'Asset Monetization',
                description:
                    'Global audit for creators and authors, blockchain-native paywall for selling digitall assets.',
              ),
              ServiceIntroCardMobileView(
                asset: Assets.idAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'Decentralized Identity',
                description:
                    'Self-Sovereign Identity, ERC1056, W3C DID support, multi-controller, Decentralized PublicKey Infrastructure.',
              ),
              ServiceIntroCardMobileView(
                  asset: Assets.credAsset,
                  h: MediaQuery.of(context).size.height,
                  w: MediaQuery.of(context).size.width,
                  title: 'Verifiable Credentials',
                  description:
                      'Wallet-First user centric credentials, based on W3C Verifiable Credentials v2.0, selective disclosure, standalone and registered credential support.'),
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
              padding: EdgeInsets.symmetric(horizontal: 50),
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
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
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
      'Contract Foundry is a permissionless decentralized platform that provides self-sovereign identity, verifiable credentials, and trustless smart contracts as infrastructure.\n\nWe empower users to manage their data, verify contracts and credentials securely, privately, and without intermediaries. Built on blockchain and Web3 principles, our mission is to redefine trust through automation, transparency, and control.';

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
