import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class ServiceIntroCardMobileView extends StatelessWidget {
  final double w, h;
  final String description, title;
  final Widget asset;

  const ServiceIntroCardMobileView(
      {super.key,
      required this.w,
      required this.h,
      required this.description,
      required this.title,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: SizedBox(
                    width: 350,
                    child: asset,
                  ))),
          ListTile(
            title: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  title,
                  style: context.headlineLarge!.copyWith(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                child: Padding(
                    padding: EdgeInsetsGeometry.all(4),
                    child: ListTile(
                      title: Wrap(
                        children: [
                          Text(
                            description,
                            style: context.bodyLarge!.copyWith(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
