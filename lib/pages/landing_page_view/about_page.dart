import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget _buildInteractiveMDView(
        BuildContext context, String md, ScrollController controller) =>
    InteractiveViewer(
      scaleEnabled: false,
      child: Markdown(
        styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            // Change color for paragraph text (default text)
            p: context.bodyLarge!.copyWith(
              color: Colors.white, // Your desired color for general text
            ),
            // Change color for headings (e.g., H1)
            h1: context.headlineLarge!.copyWith(
              color: Colors.white, // Your desired color for H1
            ),
            h3: context.headlineSmall!.copyWith(
              color: Colors.white, // Your desired color for H1
            ),
            h2: context.headlineMedium!.copyWith(
              color: Colors.white, // Your desired color for H1
            ),
            h5: context.displaySmall!.copyWith(
              color: Colors.white, // Your desired color for H1
            ),
            h6: context.displaySmall!.copyWith(
              color: Colors.white, // Your desired color for H1
            ),
            // Change color for links
            a: TextStyle(
              color: Colors.blueAccent, // Your desired color for links
              decoration: TextDecoration.underline, // Keep underline for links
            ),
            // Change color for code blocks
            code: TextStyle(
              color: Colors.blueAccent,
              backgroundColor:
                  Colors.grey.shade900, // Optional: for code block background
            ),
            // Change color for bold text (strong emphasis)
            strong: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // Change color for italic text (emphasis)
            em: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            // Change color for blockquotes
            blockquote: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            listBullet: TextStyle(
              color: Colors.white, // Color for list bullets
            ),
            textAlign: WrapAlignment.spaceEvenly),
        data: md,
        controller: controller,
        onTapLink: (text, href, title) {
          launchUrlString(href!);
        },
      ),
    );

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
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(4),
        child: _buildInteractiveMDView(context, _aboutText, _controller));
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
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              child: _buildInteractiveMDView(context, _about, _controller),
            )),
            Expanded(
                child: SizedBox(
              child: _buildInteractiveMDView(context, _vision, _controller),
            )),
            Expanded(
                child: SizedBox(
              child: _buildInteractiveMDView(context, _mission, _controller),
            )),
          ],
        ));
  }

  final _about = '''
# About

Contract Foundry is a permissionless decentralized Web3 platform that empowers individuals, agencies, and enterprises to manage digital identities, sign legally binding contracts, and issue verifiable credentials without reliance on third parties. users interact directly with smart contracts, keeping full control over their data, identity, and digital assets.


Contact Us For Further Inquiries

Email: [contractfoundry@gmail.com](contractfoundry@gmail.com)
''';

  final _vision = '''
# Vision

Empowering sovereign users in a trustless Web3 where control, identity and trust are on-chain.
''';

  final _mission = '''
# Mission

- Develop secure and verifiable smart contract infrastructure.

- Enable trustless interactions without third-party reliance.

- Ensure user sovereignty over identity, data, and digital assets.
''';
}
