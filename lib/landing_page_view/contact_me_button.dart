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
Contract Foundry is a blockchain-powered platform providing businesses with
decentralized tools for automating smart contracts, managing self-sovereign
digital identities, verifying tamper-proof credentials, and securing digital
signatures.

It eliminates intermediaries, enhances trust, and ensures
transparency in business operations, driving efficiency and security in the
Web3 era.

contact us at contractfoundry@gmail.com
 ''';
