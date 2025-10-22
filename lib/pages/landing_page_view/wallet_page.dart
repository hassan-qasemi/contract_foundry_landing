import 'package:avatar_glow/avatar_glow.dart';
import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalletIntroPageView extends StatelessWidget {
  const WalletIntroPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cns) =>
            cns.maxWidth > 650 ? _DesktopView() : _MobileView());
  }
}

class _DesktopView extends StatefulWidget {
  const _DesktopView({super.key});

  @override
  State<_DesktopView> createState() => __DesktopViewState();
}

class __DesktopViewState extends State<_DesktopView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
      child: Center(
          child: Row(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(children: [
                    const Expanded(child: SizedBox()),
                    Text(
                      'Florune Wallet: The Secure Gateway to the ContractFoundry Ecosystem\n\n',
                      style: context.titleLarge!.copyWith(color: Colors.white),
                    ),
                    Text(
                      _descriptions,
                      style: context.bodyLarge!.copyWith(color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                    const Expanded(child: SizedBox()),
                  ]))),
          Expanded(
              child: SizedBox(
                  child: Column(
            children: [
              const Expanded(child: SizedBox()),
              AvatarGlow(
                  glowColor: context.surfaceContainer,
                  repeat: true,
                  animate: true,
                  child: Icon(
                    Icons.downloading_rounded,
                    size: context.displayLarge!.fontSize! * 5,
                    color: context.primaryColor.withAlpha(80),
                  )),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Install Wallet',
                style: context.displayLarge!
                    .copyWith(color: context.primaryColor.withAlpha(80)),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: 500,
                  child: ListTile(
                    leading:
                        Iconify(Ph.github_logo, color: context.primaryColor),
                    title: Text('From Github'),
                    trailing: TextButton.icon(
                      onPressed: () async {
                        await launchUrlString(Links.appDownloadRepoAddress);
                      },
                      label: Text(
                        'Install',
                      ),
                      icon: const Icon(Icons.launch_outlined),
                    ),
                  )),
              const Expanded(child: SizedBox()),
            ],
          )))
        ],
      )),
    );
  }

  final _descriptions = '''
Florune Wallet is the official, non-custodial interface for the Contract Foundry ecosystem, engineered to provide users with direct and sovereign control over their onchain agreements and assets. It functions as the primary command center for interacting with ecosystem smart contracts, enabling the management of digital identity, the execution of legally-binding document signatures, and the autonomous control of financial obligations and subscriptions.

Architected with security as its foundation, the wallet ensures all cryptographic operations from private key management to transaction and document signing are processed locally on the user's device. Private keys are secured within a multi-encryption-layered local database and never leave the client environment. Developed according to stringent secure coding principles, this design eliminates central points of failure, guaranteeing that users retain absolute, non-custodial control over their data and funds while engaging with the enterprise-grade capabilities of the Contract Foundry.
''';
}

class _MobileView extends StatefulWidget {
  const _MobileView({super.key});

  @override
  State<_MobileView> createState() => __MobileViewState();
}

class __MobileViewState extends State<_MobileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25),
        // padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Center(
            child: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          AvatarGlow(
              glowColor: context.surfaceContainer,
              repeat: true,
              animate: true,
              child: Icon(
                Icons.downloading_rounded,
                size: context.displayLarge!.fontSize! * 5,
                color: context.primaryColor.withAlpha(80),
              )),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Install Wallet',
            style: context.displayLarge!
                .copyWith(color: context.primaryColor.withAlpha(80)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 150,
          ),
          SizedBox(
              width: 500,
              child: ListTile(
                leading: Iconify(Ph.github_logo, color: context.primaryColor),
                title: Text('From Github'),
                trailing: TextButton.icon(
                  onPressed: () async {
                    await launchUrlString(Links.appDownloadRepoAddress);
                  },
                  label: Text(
                    'Install',
                  ),
                  icon: const Icon(Icons.launch_outlined),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Florune Wallet: The Secure Gateway to the ContractFoundry Ecosystem\n\n',
            style: context.titleLarge!.copyWith(color: Colors.white),
          ),
          Text(
            _descriptions,
            style: context.bodyLarge!.copyWith(color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 30,
          ),
        ])));
  }

  final _descriptions = '''
Florune Wallet is the official, non-custodial interface for the Contract Foundry ecosystem, engineered to provide users with direct and sovereign control over their onchain agreements and assets. It functions as the primary command center for interacting with ecosystem smart contracts, enabling the management of digital identity, the execution of legally-binding document signatures, and the autonomous control of financial obligations and subscriptions.

Architected with security as its foundation, the wallet ensures all cryptographic operations from private key management to transaction and document signing are processed locally on the user's device. Private keys are secured within a multi-encryption-layered local database and never leave the client environment. Developed according to stringent secure coding principles, this design eliminates central points of failure, guaranteeing that users retain absolute, non-custodial control over their data and funds while engaging with the enterprise-grade capabilities of the Contract Foundry.
''';
}
