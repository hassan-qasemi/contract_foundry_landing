import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContractLinkerSearchBar extends StatefulWidget {
  const ContractLinkerSearchBar({super.key});

  @override
  State<ContractLinkerSearchBar> createState() =>
      _ContractLinkerSearchBarState();
}

class _ContractLinkerSearchBarState extends State<ContractLinkerSearchBar> {
  final _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadLink(String did) async {
    await launchUrlString('https://contractfoundry.web.app/contract/$did');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SearchBar(
        controller: _controller,
        trailing: [
          TextButton.icon(
            onPressed: () async {
              await _loadLink(_controller.text);
            },
            label: Text('Link contract'),
            icon: const Icon(Icons.search_outlined),
          )
        ],
        onSubmitted: (did) async {
          await _loadLink(did);
        },
        hintText: 'Enter contract DID here',
      ),
    );
  }
}
