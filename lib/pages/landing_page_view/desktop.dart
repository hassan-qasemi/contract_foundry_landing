import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../service_intro_pages/desktop.dart';
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
          // TextButton.icon(
          //   onPressed: () {
          //     context.goNamed('contract_loader_page');
          //   },
          //   label: Text('Link contract'),
          //   icon: const Icon(Icons.launch_outlined),
          // ),
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
            children: [
              _HeadPage(),
              DesktopServiceTile(
                asset: Assets.docAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                rtl: true,
                title: 'OnChain Document Verification',
                description:
                    'Issue secure, tamper-proof digital qualifications with instant verification, building trust and preventing fraud effortlessly',
              ),
              DesktopServiceTile(
                asset: Assets.paperAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'P2P Payment & Escrow',
                description:
                    'Enable risk-free transactions with automated escrow payments, funds release only when agreed conditions are met, eliminating disputes and middlemen',
              ),
              DesktopServiceTile(
                asset: Assets.apwAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                rtl: true,
                title: 'Asset Monetization',
                description:
                    'Securely audit and monetize digital creations worldwide with blockchain-based paywalls tailored for creators and authors',
              ),
              DesktopServiceTile(
                asset: Assets.idAsset,
                h: MediaQuery.of(context).size.height,
                w: MediaQuery.of(context).size.width,
                title: 'Decentralized  Identity',
                description:
                    'Take control of your digital identity with privacy-focused, decentralized IDs (ERC1056/W3C compliant) and trusted credential issuance & verification',
              ),
              DesktopServiceTile(
                  asset: Assets.credAsset,
                  h: MediaQuery.of(context).size.height,
                  w: MediaQuery.of(context).size.width,
                  rtl: true,
                  title: 'Verifiable Credentials',
                  description:
                      'Issue tamper-proof wallet-first digital credentials, offering instant verification, selective disclosure, and registered credentials for maximum trust'),
              AboutPage()
            ],
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
                                  style: context.displayLarge!.copyWith(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                            const Expanded(child: SizedBox()),
                            Wrap(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 40),
                                    child: Wrap(
                                      children: [
                                        Text(
                                          _description,
                                          style: context.bodyLarge!.copyWith(
                                              color: context.primaryColor),
                                          // textAlign: TextAlign.justify,
                                        )
                                      ],
                                    )),
                                SizedBox(height: 25),
                                // Padding(
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 20),
                                //     child: Wrap(
                                //       children: [
                                //         Text(
                                //             'The Contract Foundry Wallet beta will be available to users on our early access list',
                                //             textAlign: TextAlign.center,
                                //             style: context.bodyMedium!.copyWith(
                                //                 color: Colors.white,
                                //                 fontWeight: FontWeight.bold)),
                                //       ],
                                //     )),
                                ListTile(
                                  title: Wrap(
                                    children: [
                                      Text(
                                          'The Contract Foundry Wallet beta will be available to users on our early access list',
                                          textAlign: TextAlign.center,
                                          style: context.bodySmall!.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  trailing: FilledButton.tonal(
                                      onPressed: () async {
                                        await launchUrlString(
                                            Links.requestBetaLink);
                                      },
                                      child: Text('Request Early Access')),
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
                              'Decentralized\nTrustless\nInfrastructure',
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
