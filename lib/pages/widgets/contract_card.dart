import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:contract_foundry_landing_page/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String title, description;
  const PriceCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 280,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: context.surfaceContainer.withAlpha(95),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          ListTile(
            title: Text(
              title,
              style: context.displaySmall!.copyWith(color: Colors.white),
            ),
            subtitle: SizedBox(),
          ),
          const Expanded(child: SizedBox()),
          ListTile(
            title: Text(
              description,
              style: context.titleMedium!.copyWith(color: Colors.white),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
