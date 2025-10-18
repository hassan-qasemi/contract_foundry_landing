import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
                width: w,
                child: Text(
                    style: context.bodyLarge!.copyWith(color: Colors.white70),
                    _aboutText)),
            const Expanded(child: SizedBox()),
          ],
        ));
  }

  final _aboutText = '''
About MetaRune

MetaRune is a trustless SCaaS platform for managing payments, agreements, and data—without intermediaries. With on-chain verification, decentralized identity, and trustless escrows, users stay in full control of funds, keys, and documents, stored on IPFS, Arweave, or centralized options.

Mission

Give individuals and businesses full control over funds, data, and identity—secure, private, and automated.

Vision

Enable a world of trustless, borderless agreements with portable, private digital identities.''';
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                  width: w * .4,
                  height: h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        style: context.titleMedium!
                            .copyWith(color: Colors.white70),
                        about,
                        // textAlign: TextAlign.justify,
                      )
                    ],
                  )),
              SizedBox(
                width: w * .4,
                height: h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: w * .3,
                      child: Wrap(
                        children: [
                          Text(
                              style: context.titleMedium!
                                  .copyWith(color: Colors.white70),
                              '\nVision\n'
                              '\nWe envision a world where people and organizations enjoy complete sovereignty over their assets and data, enabling trustless, borderless agreements backed by secure, portable, and private identities. MetaRune is building the infrastructure to make this vision a reality.')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: w * .3,
                      child: Wrap(
                        children: [
                          Text(
                              style: context.titleMedium!
                                  .copyWith(color: Colors.white70),
                              '\nMission\n'
                              '\nOur mission is to empower individuals and enterprises with full control over their funds, data, and digital identity. We aim to eliminate intermediaries, enhance privacy, and enable secure, automated, and censorship-resistant interactions that put users in complete control.\n')
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ));
  }

  final about =
      'About MetaRune\n\nMetaRune is a Smart Contract-as-a-Service platform that provides trustless, non-custodial infrastructure, empowering users to manage payments, agreements, and data verification securely—without intermediaries. By combining trustless escrow services, on-chain document verification, and decentralized identity, MetaRune ensures users maintain full control over their funds, private keys, and documents.\n\nUnlike traditional platforms or centralized escrows, every interaction on MetaRune is executed transparently on-chain. Users can self-host documents via centralized or decentralized storage options like IPFS or Arweave, creating a fully trustless ecosystem where agreements, payments, and verifications are automated, censorship-resistant, and fraud-proof.';
}
