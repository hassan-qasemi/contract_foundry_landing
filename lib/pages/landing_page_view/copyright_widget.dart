import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            children: [
              Wrap(
                children: [
                  Text(
                    'Copyright © 2025 Contract Foundry. All Rights Reserved. Patent Pending.',
                    textAlign: TextAlign.center,
                    style: context.bodySmall!.copyWith(color: Colors.white),
                  )
                ],
              )
            ],
          )),
    );
  }
}
