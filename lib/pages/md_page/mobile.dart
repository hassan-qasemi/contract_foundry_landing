import 'package:contract_foundry_landing_page/services/md_doc_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'form.dart';

class MDDocPageMobileView extends StatelessWidget {
  final MDDocModel doc;
  final String title;
  MDDocPageMobileView({super.key, required this.doc, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: MDDocForm(
          doc: doc,
        ),
      ),
    );
  }
}
