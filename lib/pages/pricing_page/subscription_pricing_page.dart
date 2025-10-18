import 'package:contract_foundry_landing_page/pages/widgets/price_card.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class SubscriptionPricingPage extends StatelessWidget {
  const SubscriptionPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      // padding: EdgeInsets.all(20),
      child: LayoutBuilder(
          builder: (ctx, cns) =>
              cns.maxWidth > 600 ? _DesktopView() : _MobileView()),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const SizedBox(),
          title: Text(
            'Subscriptions',
            style: context.displayLarge!.copyWith(color: Colors.white),
          ),
          subtitle: Text(''),
        ),
        const Expanded(child: SizedBox()),
        Wrap(
          children: [
            PriceCard(
                title: 'Freelancer',
                description:
                    '\n\n25% Discount per item plus 66 \$Rune, Independent contractors handling multiple clients or small projects.\n\nArbitrum: 0.3825 ETH\nPolygon: 6763.8 POL'),
            PriceCard(
                title: 'Agency',
                description:
                    '\n\n30% Discount per item plus 165 \$Rune, Small to medium teams managing multiple clients/projects.\n\nArbitrum: 0.97 ETH\nPolygon: 17152.69 POL'),
            PriceCard(
                title: 'Startup',
                description:
                    '\n\n35% Discount per item plus 264 \$Rune, startups, product teams, or businesses in growth stage.\n\nArbitrum: 1.8 ETH\nPolygon: 31829.73 POL'),
            PriceCard(
                title: 'Enterprise',
                description:
                    '\n\n40% Discount per item plus 363 \$Rune, Corporations, governments and organizations with massive contract volumes.\n\nArbitrum: 4.78 ETH\nPolygon: 84525.6 POL'),
          ],
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  Widget _space() => const SizedBox(
        height: 45,
      );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(35),
      child: ListView(
        children: [
          ListTile(
            leading: const SizedBox(),
            title: Text(
              'Subscriptions',
              style: context.displayMedium!.copyWith(color: Colors.white),
            ),
          ),
          _space(),
          PriceCard(
              title: 'Freelancer',
              description:
                  '\n\n25% Discount per item plus 66 \$Rune, Independent contractors handling multiple clients or small projects.\n\nArbitrum: 0.3825 ETH\nPolygon: 6763.8 POL'),
          _space(),
          PriceCard(
              title: 'Agency',
              description:
                  '\n\n30% Discount per item plus 165 \$Rune, Small to medium teams managing multiple clients/projects.\n\nArbitrum: 0.97 ETH\nPolygon: 17152.69 POL'),
          _space(),
          PriceCard(
              title: 'Startup',
              description:
                  '\n\n35% Discount per item plus 264 \$Rune, startups, product teams, or businesses in growth stage.\n\nArbitrum: 1.8 ETH\nPolygon: 31829.73 POL'),
          _space(),
          PriceCard(
              title: 'Enterprise',
              description:
                  '\n\n40% Discount per item plus 363 \$Rune, Corporations, governments and organizations with massive contract volumes.\n\nArbitrum: 4.78 ETH\nPolygon: 84525.6 POL'),
        ],
      ),
    ));
  }
}
