import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/social_links_widget.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cns) =>
            cns.maxWidth > 1100 ? _DesktopView() : _MovileView());
  }
}

class _MovileView extends StatefulWidget {
  const _MovileView({super.key});

  @override
  State<_MovileView> createState() => __MovileViewState();
}

class __MovileViewState extends State<_MovileView> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        // child: _buildInteractiveMDView(context, _aboutText, _controller)
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            _buildInfoTile('About Us', [_aboutText]),
            _buildInfoTile('Vision', [
              'We envision a world where people and organizations enjoy complete sovereignty over their assets and data, enabling trustless, borderless agreements backed by secure, portable, and private identities. Florune is building the infrastructure to make this vision a reality.'
            ]),
            _buildInfoTile('Mission', [
              'Our mission is to empower individuals and enterprises with full control over their funds, data, and digital identity. We aim to eliminate intermediaries, enhance privacy, and enable secure, automated, and censorship-resistant interactions that put users in complete control.'
            ]),
            _buildInfoTile('Learn', []),
            ListTile(
              leading: TextButton.icon(
                label: Text('Get LightPaper'),
                onPressed: () async {
                  await launchUrlString(Links.whitePaperLink);
                },
                icon: const Icon(Icons.launch_outlined),
              ),
            ),
            _buildInfoTile(
                'More info, sales & feedback ', ['info@florune.net']),
            _buildInfoTile('Adminstration contact', ['admin@florune.net']),
            _buildInfoTile('Social media', []),
            SocialLinksWidget(),
            SizedBox(
              height: 30,
            )
          ],
        ));
  }

  Widget _buildInfoTile(String title, List<String> body) => Column(
        children: [
          ListTile(
              title: Text(
            title,
            style: context.titleLarge!.copyWith(color: Colors.white),
          )),
          ...body.map((e) => ListTile(
                title: Text(
                  e,
                  style: context.bodyMedium!.copyWith(color: Colors.white),
                ),
              ))
        ],
      );

  final _aboutText = '''

Florune empowers sovereign control over digital agreements and payments. Our platform integrates non-custodial escrow, on-chain verification, and decentralized identity to enable secure, intermediary-free transactions. Every interaction executes through transparent smart contracts, creating a tamper-proof system where users maintain full control of assets and data.

Florune embodies the principles of financial autonomy and censorship-resistant technology. We create tools for trustless transactions where users can securely manage agreements through decentralized storage and automated smart contracts, ensuring complete sovereignty over digital interactions.  

The platform operates in a non-custodial manner, users retain full control over their assets and data. Patent-pending technology operated inventor as a sole proprietorship.
''';
}

class _DesktopView extends StatefulWidget {
  const _DesktopView({super.key});

  @override
  State<_DesktopView> createState() => __DesktopViewState();
}

class __DesktopViewState extends State<_DesktopView> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(35),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      _buildInfoTile('About Us', [about]),
                      _buildInfoTile('Vision', [
                        'We envision a world where people and organizations enjoy complete sovereignty over their assets and data, enabling trustless, borderless agreements backed by secure, portable, and private identities. Florune is building the infrastructure to make this vision a reality.'
                      ]),
                      _buildInfoTile('Mission', [
                        'Our mission is to empower individuals and enterprises with full control over their funds, data, and digital identity. We aim to eliminate intermediaries, enhance privacy, and enable secure, automated, and censorship-resistant interactions that put users in complete control.'
                      ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      _buildInfoTile('Learn', []),
                      ListTile(
                        leading: TextButton.icon(
                          label: Text('Get LightPaper'),
                          onPressed: () async {
                            await launchUrlString(Links.whitePaperLink);
                          },
                          icon: const Icon(Icons.launch_outlined),
                        ),
                      ),
                      _buildInfoTile(
                          'More info, sales & feedback ', ['info@florune.net']),
                      _buildInfoTile(
                          'Adminstration contact', ['admin@florune.net']),
                      _buildInfoTile('Social media', []),
                      SocialLinksWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildInfoTile(String title, List<String> body) => Column(
        children: [
          ListTile(
              title: Text(
            title,
            style: context.titleLarge!.copyWith(color: Colors.white),
          )),
          ...body.map((e) => ListTile(
                title: Text(
                  e,
                  style: context.bodyMedium!.copyWith(color: Colors.white),
                ),
              ))
        ],
      );

  final about = '''
Florune empowers sovereign control over digital agreements and payments. Our platform integrates non-custodial escrow, on-chain verification, and decentralized identity to enable secure, intermediary-free transactions. Every interaction executes through transparent smart contracts, creating a tamper-proof system where users maintain full control of assets and data.

Florune embodies the principles of financial autonomy and censorship-resistant technology. We create tools for trustless transactions where users can securely manage agreements through decentralized storage and automated smart contracts, ensuring complete sovereignty over digital interactions.  

The platform operates in a non-custodial manner, users retain full control over their assets and data. Patent-pending technology operated inventor as a sole proprietorship.
''';
}
