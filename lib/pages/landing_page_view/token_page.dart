import 'package:avatar_glow/avatar_glow.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';

class TokenPage extends StatelessWidget {
  const TokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cns) =>
            cns.maxWidth > 650 ? _Desktopview() : _MobileView());
  }
}

class _Desktopview extends StatefulWidget {
  const _Desktopview({super.key});

  @override
  State<_Desktopview> createState() => __DesktopviewState();
}

class __DesktopviewState extends State<_Desktopview> {
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
                      _descriptions,
                      style: context.bodyLarge!.copyWith(color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                    const Expanded(child: SizedBox()),
                    ListTile(
                      trailing: TextButton.icon(
                        onPressed: null,
                        label: Text('Mint Flare'),
                        icon: const Icon(Icons.launch_outlined),
                      ),
                      leading: TextButton.icon(
                        onPressed: null,
                        label: Text('Request Permission'),
                        icon: const Icon(Icons.launch_outlined),
                      ),
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
                    Icons.token_outlined,
                    size: context.displayLarge!.fontSize! * 5,
                    color: context.primaryColor.withAlpha(80),
                  )),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Permissions & Tokens',
                style: context.displayLarge!
                    .copyWith(color: context.primaryColor.withAlpha(80)),
              ),
              const SizedBox(
                height: 50,
              ),
              const Expanded(child: SizedBox()),
            ],
          )))
        ],
      )),
    );
  }

  final _descriptions = '''
Flare: The Invitational Access Credential

Flare (\$FLR) represents an exclusive entry point to the Contract Foundry ecosystem's premium tier a stable-value ERC-20 token available by invitation only. This privileged access credential grants selected participants the unique ability to acquire Rune tokens, creating an ecosystem where advanced capabilities remain accessible only to vetted partners.


Rune:  The Sovereign Execution Asset

Rune (\$Rune) Rune serves as the distinguished medium for high-value contractual execution an exclusive, non-transferable asset reserved for FLR credential holders. This elite instrument enables secure deployment of sophisticated operations including Pledge Contracts and Verifiable Documents, providing an elevated layer of transaction assurance while maintaining uncompromising standards for specialized service execution.
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
            height: 50,
          ),
          AvatarGlow(
              glowColor: context.surfaceContainer,
              repeat: true,
              animate: true,
              child: Icon(
                Icons.token_outlined,
                size: context.displayLarge!.fontSize! * 5,
                color: context.primaryColor.withAlpha(80),
              )),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Permissions & Tokens',
            style: context.displayLarge!
                .copyWith(color: context.primaryColor.withAlpha(80)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 150,
          ),
          Text(
            _descriptions,
            style: context.bodyLarge!.copyWith(color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          // const Expanded(child: SizedBox()),
          ListTile(
            trailing: TextButton.icon(
              onPressed: null,
              label: Text('Mint Flare'),
              icon: const Icon(Icons.launch_outlined),
            ),
            leading: TextButton.icon(
              onPressed: null,
              label: Text('Request Permission'),
              icon: const Icon(Icons.launch_outlined),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ])));
  }

  final _descriptions = '''
Flare: The Invitational Access Credential

Flare (\$FLR) represents an exclusive entry point to the Contract Foundry ecosystem's premium tier a stable-value ERC-20 token available by invitation only. This privileged access credential grants selected participants the unique ability to acquire Rune tokens, creating an ecosystem where advanced capabilities remain accessible only to vetted partners.


Rune:  The Sovereign Execution Asset

Rune (\$Rune) Rune serves as the distinguished medium for high-value contractual execution an exclusive, non-transferable asset reserved for FLR credential holders. This elite instrument enables secure deployment of sophisticated operations including Pledge Contracts and Verifiable Documents, providing an elevated layer of transaction assurance while maintaining uncompromising standards for specialized service execution.
''';
}
