import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/utils/md_doc_handler.dart';
import 'package:flutter/material.dart';
import 'mobile.dart';

class MDDocPageView extends StatelessWidget {
  final String docPath;
  final String title;

  const MDDocPageView({super.key, required this.docPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadMDDoc(docPath),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            if (s.data == null) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    children: [Text('Document loading failed')],
                  ),
                ),
              );
            }

            return MDDocPageMobileView(
              doc: s.data!,
              title: title,
            );
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                GlassmorphismBackground(
                  isDarkMode: true,
                ),
                Center(child: CircularProgressIndicator())
              ],
            ),
          );
        });
  }
}
