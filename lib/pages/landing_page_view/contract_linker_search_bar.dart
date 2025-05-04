import 'package:contract_foundry_landing_page/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void _linkContarctDID(String did) {
    try {
      checkDID(did);

      context.go('/contract/$did');
    } catch (err) {
      showDialog(
          context: context,
          builder: (c) => AlertDialog(
                content: ListTile(
                  leading: const Icon(
                    Icons.error_outline_outlined,
                  ),
                  title: Wrap(
                    children: [Text(err.toString())],
                  ),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SearchBar(
        controller: _controller,
        trailing: [
          TextButton.icon(
            onPressed: () {
              _linkContarctDID(_controller.text);
            },
            label: Text('Link contract'),
            icon: const Icon(Icons.search_outlined),
          )
        ],
        onSubmitted: (did) {
          _linkContarctDID(did);
        },
        hintText: 'Enter contract DID here',
      ),
    );
  }
}
