import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContractPageView extends StatelessWidget {
  final String contractDID;
  const ContractPageView({super.key, required this.contractDID});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: Future(() {
    //       try {
    //         checkDID(contractDID);

    //         // launchUrlString(
    //         //     'https://contractfoundry.web.app/contract/$contractDID');

    //         final appLink =
    //             'https://contractfoundry.web.app/contract/$contractDID';
    //         html.window.location.href = appLink;
    //       } catch (err) {
    //         showDialog(
    //             context: context,
    //             builder: (c) => AlertDialog(
    //                   content: ListTile(
    //                     leading: const Icon(
    //                       Icons.error_outline_outlined,
    //                     ),
    //                     title: Wrap(
    //                       children: [Text(err.toString())],
    //                     ),
    //                   ),
    //                 ));
    //       }
    //     }),
    //     builder: (c, s) =>
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            GlassmorphismBackground(
              isDarkMode: true,
            ),
            Center(
                child: Column(children: [
              Expanded(child: SizedBox()),
              Icon(
                Icons.downloading_rounded,
                color: context.primaryContainer.withAlpha(190),
                size: 300,
              ),
              SizedBox(height: 30),
              TextButton.icon(
                  onPressed: () async {
                    await launchUrlString(Links.appDownloadRepoAddress);
                  },
                  label: Text('Download wallet app'),
                  icon: Icon(Icons.download)),
              Expanded(child: SizedBox()),
            ]))
          ],
        ),
      ),
    );
  }
}
