import 'package:flutter/material.dart';

import 'form.dart';

class FAQPageMobileView extends StatelessWidget {
  FAQPageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FAQForm(),
      ),
    );
  }
}
