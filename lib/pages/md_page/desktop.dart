import 'package:contract_foundry_landing_page/services/md_doc_handler.dart';
import 'package:flutter/material.dart';
import 'form.dart';

class MDDocPageDesktopView extends StatelessWidget {
  final MDDocModel doc;
  final String title;

  MDDocPageDesktopView({super.key, required this.doc, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: [
          const Expanded(child: SizedBox()),
          Container(
            height: h,
            width: w * .5,
            child: MDDocForm(
              doc: doc,
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
