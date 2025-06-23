import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class DesktopServiceTile extends StatelessWidget {
  final double w, h;
  final String description, title;
  final Widget asset;
  final bool rtl;

  const DesktopServiceTile(
      {super.key,
      required this.w,
      required this.h,
      required this.description,
      required this.title,
      this.rtl = false,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      child: Row(
        children: [
          if (rtl) ...[
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsetsGeometry.all(7),
                    child: SizedBox(
                      child: asset,
                    ))),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                      padding: EdgeInsetsGeometry.all(7),
                      child: Column(children: [
                        const Expanded(child: SizedBox()),
                        ListTile(
                          title: Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              Text(
                                title,
                                style: context.headlineLarge!.copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Wrap(
                            children: [
                              Text(
                                description,
                                style: context.bodyLarge!.copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ])),
                )),
          ] else ...[
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                      padding: EdgeInsetsGeometry.all(7),
                      child: Column(children: [
                        const Expanded(child: SizedBox()),
                        ListTile(
                          title: Wrap(
                            children: [
                              Text(
                                title,
                                style: context.headlineLarge!.copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Wrap(
                            children: [
                              Text(
                                description,
                                style: context.bodyLarge!.copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ])),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsetsGeometry.all(7),
                    child: SizedBox(
                      child: asset,
                    ))),
          ]
        ],
      ),
    );
  }
}
