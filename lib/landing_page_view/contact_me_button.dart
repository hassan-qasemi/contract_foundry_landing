import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class ContactMeButton extends StatelessWidget {
  const ContactMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          _showAboutDialog(context);
        },
        child: Text('About'));
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              title: Text(
                'About Contract Foundry',
                style: context.titleMedium!.copyWith(color: Colors.white),
              ),
              content: Wrap(
                children: [
                  Text(
                    _aboutText,
                    style: context.bodyMedium!.copyWith(color: Colors.white),
                  )
                ],
              ),
            ));
  }
}

const _aboutText = '''
Contract Foundry provides blockchain modules as scalable business solutions,
SLC's and SSI's.  

contact us at contractfoundry@gmail.com
 ''';
