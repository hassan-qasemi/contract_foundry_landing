import 'package:contract_foundry_landing_page/pages/landing_page_view/desktop.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/mobile.dart';
import 'package:contract_foundry_landing_page/theme/color_scheme.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Banner(
        message: 'Patent Pending',
        location: BannerLocation.bottomEnd,
        child: Theme(
            data: ThemeData(
                useMaterial3: true,
                colorScheme: MaterialTheme.darkScheme(),
                textTheme: GoogleFonts.montserratTextTheme()),
            child: LayoutBuilder(builder: (ctx, cns) {
              if (cns.maxWidth > 1100) {
                return LandingPageDesktop();
              }

              return LandingPageMobile();
            })));
  }
}
