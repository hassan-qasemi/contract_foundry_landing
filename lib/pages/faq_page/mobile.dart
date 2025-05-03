import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Home'))
        ],
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
