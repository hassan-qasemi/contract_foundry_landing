import 'package:contract_foundry_landing_page/config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContarctPageView extends StatelessWidget {
  const ContarctPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Column(children: [
          Expanded(child: SizedBox()),
          Text('Directing to app'),
          SizedBox(height: 30),
          TextButton.icon(
              onPressed: () async {
                await launchUrlString(Links.appDownloadRepoAddress);
              },
              label: Text('Download app'),
              icon: Icon(Icons.download)),
          Expanded(child: SizedBox()),
        ])),
      ),
    );
  }
}
