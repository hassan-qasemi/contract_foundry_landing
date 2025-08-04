import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

// Widget _buildInteractiveMDView(
//         BuildContext context, String md, ScrollController controller) =>
//     InteractiveViewer(
//       scaleEnabled: false,
//       child: Markdown(
//         styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
//         styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
//             // Change color for paragraph text (default text)
//             p: context.bodyLarge!.copyWith(
//               color: Colors.white, // Your desired color for general text
//             ),
//             // Change color for headings (e.g., H1)
//             h1: context.headlineLarge!.copyWith(
//               color: Colors.white, // Your desired color for H1
//             ),
//             h3: context.headlineSmall!.copyWith(
//               color: Colors.white, // Your desired color for H1
//             ),
//             h2: context.headlineMedium!.copyWith(
//               color: Colors.white, // Your desired color for H1
//             ),
//             h5: context.displaySmall!.copyWith(
//               color: Colors.white, // Your desired color for H1
//             ),
//             h6: context.displaySmall!.copyWith(
//               color: Colors.white, // Your desired color for H1
//             ),
//             // Change color for links
//             a: TextStyle(
//               color: Colors.blueAccent, // Your desired color for links
//               decoration: TextDecoration.underline, // Keep underline for links
//             ),
//             // Change color for code blocks
//             code: TextStyle(
//               color: Colors.blueAccent,
//               backgroundColor:
//                   Colors.grey.shade900, // Optional: for code block background
//             ),
//             // Change color for bold text (strong emphasis)
//             strong: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//             // Change color for italic text (emphasis)
//             em: TextStyle(
//               color: Colors.white,
//               fontStyle: FontStyle.italic,
//             ),
//             // Change color for blockquotes
//             blockquote: TextStyle(
//               color: Colors.white,
//               fontStyle: FontStyle.italic,
//             ),
//             listBullet: TextStyle(
//               color: Colors.white, // Color for list bullets
//             ),
//             textAlign: WrapAlignment.spaceEvenly),
//         data: md,
//         controller: controller,
//         onTapLink: (text, href, title) {
//           launchUrlString(href!);
//         },
//       ),
//     );

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
        margin: EdgeInsets.all(7),
        // child: _buildInteractiveMDView(context, _aboutText, _controller)
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
                width: w,
                child: Expanded(
                    child: Text(
                        style:
                            context.bodyLarge!.copyWith(color: Colors.white70),
                        textAlign: TextAlign.justify,
                        'About Contract Foundry\n'
                        '\nContract Foundry is a permissionless decentralized Web3 platform that empowers individuals, agencies, and enterprises to manage digital identities, sign legally binding contracts, and issue verifiable credentials without reliance on third parties. users interact directly with smart contracts, keeping full control over their data, identity, and digital assets.\n'
                        '\nVision\n'
                        '\nEmpowering sovereign users in a trustless Web3 where control, identity and trust are on-chain.\n'
                        '\nMission\n'
                        '\n- Develop secure and trustless smart contract as infrastructure'
                        '\n- Enable trustless interactions without third-party regulatory'
                        '\n- Ensure user sovereignty over identity, data, and digital assets\n\n'))),
            const Expanded(child: SizedBox()),
          ],
        ));
  }

  final _aboutText = '''
### About

Contract Foundry is a permissionless decentralized Web3 platform that empowers individuals, agencies, and enterprises to manage digital identities, sign legally binding contracts, and issue verifiable credentials without reliance on third parties. users interact directly with smart contracts, keeping full control over their data, identity, and digital assets.

### Vision

Empowering sovereign users in a trustless Web3 where control, identity and trust are on-chain.

### Mission

- Develop secure and verifiable smart contract infrastructure.

- Enable trustless interactions without third-party reliance.

- Ensure user sovereignty over identity, data, and digital assets.

Contact Us For Further Inquiries

Email: [contractfoundry@gmail.com](contractfoundry@gmail.com)      
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        // child: Row(
        //   children: [
        //     Expanded(
        //         child: SizedBox(
        //       child: _buildInteractiveMDView(context, _about, _controller),
        //     )),
        //     Expanded(
        //         child: SizedBox(
        //       child: _buildInteractiveMDView(context, _vision, _controller),
        //     )),
        //     Expanded(
        //         child: SizedBox(
        //       child: _buildInteractiveMDView(context, _mission, _controller),
        //     )),
        //   ],
        // )
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
                              '\nEmpowering sovereign users in a trustless Web3 where control, identity and trust are on-chain.')
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
                              '\n- Develop secure and trustless smart contract as infrastructure'
                              '\n- Enable trustless interactions without third-party regulatory'
                              '\n- Ensure user sovereignty over identity, data, and digital assets\n\n')
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

  final about = '''
About Contract Foundry

Contract Foundry is a permissionless trustless decentralized platform that
enables users automate agreements, control sovereign identity, verify
credentials instantly and certify and verify documents on blockchain securely without any middlemen.

It eliminates intermediaries, enhances trust, and ensures transparency in
business operations, driving efficiency and security in the Web3 era.

Contract Foundry leverages blockchain technology to provide decentralized solutions, eliminating intermediaries and enabling secure, trustless and efficient operations.
''';

//   final _about = '''
// # About

// Contract Foundry is a permissionless decentralized Web3 platform that empowers individuals, agencies, and enterprises to manage digital identities, sign legally binding contracts, and issue verifiable credentials without reliance on third parties. users interact directly with smart contracts, keeping full control over their data, identity, and digital assets.

// Contact Us For Further Inquiries

// Email: [contractfoundry@gmail.com](contractfoundry@gmail.com)
// ''';

//   final _vision = '''
// # Vision

// Empowering sovereign users in a trustless Web3 where control, identity and trust are on-chain.
// ''';

//   final _mission = '''
// # Mission

// - Develop secure and verifiable smart contract infrastructure.

// - Enable trustless interactions without third-party reliance.

// - Ensure user sovereignty over identity, data, and digital assets.
// ''';
}
