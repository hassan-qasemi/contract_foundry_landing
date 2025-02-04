import 'package:contract_foundry_landing_page/landing_page_view/desktop.dart';
import 'package:contract_foundry_landing_page/landing_page_view/mobile.dart';
import 'package:flutter/material.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, cns) {
      if (cns.maxWidth > 600) {
        return LandingPageDesktop();
      }

      return LandingPageMobile();
    });
  }
}
