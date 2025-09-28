import 'package:contract_foundry_landing_page/pages/landing_page_view/background.dart';
import 'package:contract_foundry_landing_page/utils/md_doc_handler.dart';
import 'package:contract_foundry_landing_page/theme/color_scheme.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MDDocForm extends StatelessWidget {
  final MDDocModel doc;

  MDDocForm({super.key, required this.doc});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, cns) {
        return SizedBox(
          height: cns.maxHeight,
          width: cns.maxWidth,
          child: InteractiveViewer(
            scaleEnabled: false,
            child: Markdown(
              styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
              data: doc.content,
              controller: _controller,
              onTapLink: (text, href, title) {
                launchUrlString(href!);
              },
            ),
          ),
        );
      },
    );
  }
}
