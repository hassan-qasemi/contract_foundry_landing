import 'package:avatar_glow/avatar_glow.dart';
import 'package:contract_foundry_landing_page/assets.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/about_page.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/token_page.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/wallet_page.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/pricing_page.dart';
import 'package:contract_foundry_landing_page/pages/pricing_page/subscription_pricing_page.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../service_intro_pages/mobile.dart';
import 'copyright_widget.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.black87,
        backgroundColor: Colors.black87,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListTile(
              leading: AvatarGlow(
                glowColor: context.surfaceContainer,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage('./icons/android-chrome-192x192.png'),
                ),
              ),
              title: Text(
                'Florune',
                style: context.titleLarge!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text('Wallet'),
              onTap: () {
                _controller.jumpToPage(7);
              },
            ),
            // ListTile(
            //   title: Text('Lightpaper'),
            //   onTap: () async {
            //     await launchUrlString(Links.whitePaperLink);
            //   },
            // ),
            ListTile(
              title: Text('Permissiones & Tokens'),
              onTap: () async {
                _controller.jumpToPage(8);
              },
            ),
            ListTile(
              title: Text('Flarion'),
              onTap: null,
              enabled: false,
              trailing: const Icon(Icons.launch_outlined),
            ),
            ListTile(
              title: Text('Pricing'),
              onTap: () async {
                _controller.jumpToPage(9);
              },
            ),
            ListTile(
              title: Text('Subscriptions'),
              onTap: () async {
                _controller.jumpToPage(10);
              },
            ),
            ListTile(
              title: Text('Docs'),
              trailing: const Icon(Icons.launch_outlined),
              onTap: () async {
                await launchUrlString(Links.documentsLink);
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () async {
                _controller.jumpToPage(11);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text(
          'Florune',
          style: context.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GlassmorphismBackground(isDarkMode: true),
          Center(
              child: PageView(
            scrollDirection: Axis.vertical,
            controller: _controller,
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
                  SizedBox(height: 25),
                  const CopyrightWidget(),
                  const SizedBox(
                    height: 20,
                  ),
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
              WalletIntroPageView(),
              TokenPage(),
              PricingPage(),
              SubscriptionPricingPage(),
              AboutPage()
            ],
          )),
        ],
      ),
    );
  }

  final _description =
      'Smart contract infrastructure enabling secure peer-to-peer interactions without intermediaries.';
}

class _HeadPage extends StatelessWidget {
  const _HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.transparent,
      child: ListView(
        children: [
          SizedBox(height: 50),
          ListTile(
            title: Text(
              'Florune based on ContractFoundry',
              style: context.titleLarge!.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Wrap(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                  child: Wrap(
                    children: [
                      Text(
                        _description,
                        style:
                            context.titleMedium!.copyWith(color: Colors.white),
                        // textAlign: TextAlign.justify,
                      )
                    ],
                  )),
              SizedBox(height: 25),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  final _description =
      '''Florune is the inaugural application of the Contract Foundry ecosystem, a sovereign onchain jurisdiction for enterprise-grade agreements.
      
This trustless, permissioned infrastructure converges decentralized identity, tamper-proof document verification, and non-custodial smart contracts to replace intermediary-dependent processes with immutable, executable logic.

Within this environment, financial obligations are bound directly to verifiable actions. Onchain digital signatures autonomously control the flow of capital through P2P escrow and payments, ensuring execution is contingent solely upon cryptographically proven performance.

The result is a closed-loop system that eliminates disputes by design, providing a court-admissible record of truth and establishing a new paradigm of operational integrity.''';
}
