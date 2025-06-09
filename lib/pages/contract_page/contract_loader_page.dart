import 'package:contract_foundry_landing_page/pages/contract_page/contract_linker_search_bar.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContractLoaderPage extends StatefulWidget {
  const ContractLoaderPage({super.key});

  @override
  State<ContractLoaderPage> createState() => _ContractLoaderPage();
}

class _ContractLoaderPage extends State<ContractLoaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text(
          'Link contract',
        ),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
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
                Icons.search_rounded,
                color: context.primaryContainer.withAlpha(150),
                size: 190,
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                  child: ContractLinkerSearchBar()),
              Expanded(child: SizedBox()),
            ]))
          ],
        ),
      ),
    );
  }
}
