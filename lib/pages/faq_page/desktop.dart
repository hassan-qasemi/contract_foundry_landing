import 'package:flutter/material.dart';
import 'form.dart';

class FAQPageDesktopView extends StatelessWidget {
  FAQPageDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Row(
        children: [
          const Expanded(child: SizedBox()),
          Container(
            height: h,
            width: w * .5,
            child: FAQForm(),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
