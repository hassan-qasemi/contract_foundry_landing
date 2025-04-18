import 'package:contract_foundry_landing_page/services/faq_handler/faq_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FAQForm extends StatelessWidget {
  FAQForm({super.key});

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
              data: FaqHandler.state?.content ?? '',
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
