import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/pricing_page.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/subscription_pricing_page.dart';
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
        title: Text('Florune'),
        titleTextStyle: context.displayMedium!.copyWith(color: Colors.white),
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.documentsLink);
              },
              child: Text('Docs')),
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.whitePaperLink);
              },
              child: Text(
                'Lightpaper',
              )),
          TextButton(
              onPressed: () async {
                await launchUrlString(Links.appDownloadRepoAddress);
              },
              child: Text('Install Wallet')),
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
              PricingPage(),
              SubscriptionPricingPage(),
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
                                leading: const SizedBox(),
                                title: Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      '',
                                      style: context.displayLarge!.copyWith(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Expanded(child: SizedBox()),
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
                                          style: context.titleMedium!.copyWith(
                                              color: context.primaryColor),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )),
                                SizedBox(height: 25),
                                // ListTile(
                                //   title: Wrap(
                                //     children: [
                                //       Text(
                                //           'The Contract Foundry Wallet beta will be available soon',
                                //           textAlign: TextAlign.center,
                                //           style: context.bodySmall!.copyWith(
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.bold)),
                                //     ],
                                //   ),
                                //   trailing: FilledButton.tonal(
                                //       onPressed: () async {
                                //         await launchUrlString(
                                //             Links.requestBetaLink);
                                //       },
                                //       child: Text('Notify me')),
                                // ),
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
      'Smart contract infrastructure enabling secure peer-to-peer interactions without intermediaries.';
}
