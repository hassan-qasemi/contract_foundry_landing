import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/services/faq_handler/faq_handler.dart';
import 'package:flutter/material.dart';
import 'mobile.dart';

class FAQPageView extends StatelessWidget {
  const FAQPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FaqHandler.initFAQHandler(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            return FAQPageMobileView();
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
