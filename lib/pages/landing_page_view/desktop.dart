import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/token_page.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/wallet_page.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/pricing_page.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/subscription_pricing_page.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../service_intro_pages/desktop.dart';
import 'background.dart';
import 'about_page.dart';
import 'copyright_widget.dart';

class LandingPageDesktop extends StatefulWidget {
  const LandingPageDesktop({super.key});

  @override
  State<LandingPageDesktop> createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text('Florune'),
        // titleTextStyle: context.displaySmall!.copyWith(color: Colors.white),
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              _controller.jumpToPage(10);
            },
            child: Text(
              'About Us',
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              await launchUrlString(Links.documentsLink);
            },
            label: Text('Docs'),
            icon: const Icon(Icons.launch_outlined),
          ),
          TextButton(
            onPressed: () async {
              _controller.jumpToPage(9);
            },
            child: Text(
              'Subscriptions',
            ),
          ),
          TextButton(
            onPressed: () async {
              _controller.jumpToPage(8);
            },
            child: Text(
              'Pricing',
            ),
          ),
          TextButton.icon(
              onPressed: null,
              label: Text(
                'Flarion',
              ),
              icon: const Icon(Icons.launch_outlined)),
          TextButton(
            onPressed: () async {
              _controller.jumpToPage(7);
            },
            child: Text(
              'Permissions & Tokens',
            ),
          ),
          // TextButton(
          //     onPressed: () async {
          //       await launchUrlString(Links.whitePaperLink);
          //     },
          //     child: Text(
          //       'Lightpaper',
          //     )),
          TextButton(
              onPressed: () {
                _controller.jumpToPage(6);
              },
              child: Text('Wallet')),
          SizedBox(
            width: 70,
          )
        ],
      ),
      body: Stack(
        children: [
          GlassmorphismBackground(isDarkMode: true),
          PageView(
            scrollDirection: Axis.vertical,
            controller: _controller,
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
              WalletIntroPageView(),
              TokenPage(),
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
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(
                              child: SizedBox(),
                              flex: 2,
                            ),
                            ListTile(
                              title: Text(
                                'Florune based on ContractFoundry',
                                style: context.titleLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Wrap(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 40),
                                    child: Wrap(
                                      children: [
                                        Text(
                                          _description,
                                          style: context.titleMedium!
                                              .copyWith(color: Colors.white),
                                          // textAlign: TextAlign.justify,
                                        )
                                      ],
                                    )),
                                SizedBox(height: 25),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const CopyrightWidget(),
                            const SizedBox(height: 10),
                            // const SocialLinksWidget(),
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
      '''Florune is the inaugural application of the Contract Foundry ecosystem, a sovereign onchain jurisdiction for enterprise-grade agreements.
      
This trustless, permissioned infrastructure converges decentralized identity, tamper-proof document verification, and non-custodial smart contracts to replace intermediary-dependent processes with immutable, executable logic.

Within this environment, financial obligations are bound directly to verifiable actions. Onchain digital signatures autonomously control the flow of capital through P2P escrow and payments, ensuring execution is contingent solely upon cryptographically proven performance.

The result is a closed-loop system that eliminates disputes by design, providing a court-admissible record of truth and establishing a new paradigm of operational integrity.''';
}
