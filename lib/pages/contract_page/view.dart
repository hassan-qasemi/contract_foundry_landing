import 'package:contract_foundry_landing_page/config.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContractPageView extends StatelessWidget {
  final String contractDID;
  const ContractPageView({super.key, required this.contractDID});

  @override
  Widget build(BuildContext context) {
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
              QrImageView(
                data: contractDID,
                version: QrVersions.auto,
                size: 350.0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
              ),
              SizedBox(height: 30),
              LayoutBuilder(
                  builder: (ctx, cns) => cns.maxWidth >= 500
                      ? Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            SizedBox(
                              width: 400,
                              child: ListTile(
                                title: Wrap(
                                  children: [Text(contractDID)],
                                ),
                                trailing: IconButton(
                                    onPressed: () async {
                                      await Clipboard.setData(
                                          ClipboardData(text: contractDID));
                                    },
                                    icon: const Icon(Icons.copy)),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        )
                      : ListTile(
                          title: Wrap(
                            children: [Text(contractDID)],
                          ),
                          trailing: IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: contractDID));
                              },
                              icon: const Icon(Icons.copy)),
                        )),
              SizedBox(height: 20),
              TextButton.icon(
                  onPressed: () async {
                    await launchUrlString(Links.appDownloadRepoAddress);
                  },
                  label: Text('Download wallet app'),
                  icon: Icon(Icons.downloading_rounded)),
              Expanded(child: SizedBox()),
            ]))
          ],
        ),
      ),
    );
  }
}
