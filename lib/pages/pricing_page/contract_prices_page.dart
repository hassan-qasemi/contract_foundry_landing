import 'package:contract_foundry_landing_page/pages/widgets/contract_card.dart';
import 'package:contract_foundry_landing_page/theme/text_theme_extensions.dart';
import 'package:flutter/material.dart';

class ContractPricesPage extends StatelessWidget {
  const ContractPricesPage({super.key});

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
            'Pricing',
            style: context.displayLarge!.copyWith(color: Colors.white),
          ),
          subtitle: Text(''),
        ),
        const Expanded(child: SizedBox()),
        Wrap(
          children: [
            PriceCard(
                title: 'Pledge',
                description:
                    '\n\nEnterprise-grade ,massive payments, 0% withdrawal fee, time-bound, revocable, for mid-high payments, document linking\n\n 33 CFGT'),
            PriceCard(
                title: 'Verifiable Document',
                description:
                    '\n\nVerifier filtering, revocable, Expirable, existance proof\n\n9 CFGT'),
            PriceCard(
                title: 'Escrow',
                description:
                    '\n\n1% withdrawal fee, time-bound, revocable, for low-mid payments\n\nArbitrum: 0.0029 ETH\nPolygon: 424.9 POL'),
            PriceCard(
                title: 'Document Registry',
                description:
                    '\n\nMulti-verifier, revocable, Expirable, existance proof\n\nArbitrum: 0.0019 ETH\nPolygon: 424.9 POL'),
            PriceCard(
                title: 'Asset Paywall',
                description:
                    '\n\nOn-chain payment, native token & stablecoin support\n\nArbitrum: 0.029 ETH\nPolygon: 424.9 POL')
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
              'Pricing',
              style: context.displayMedium!.copyWith(color: Colors.white),
            ),
          ),
          _space(),
          PriceCard(
              title: 'Pledge',
              description:
                  '\n\nEnterprise-grade ,massive payments, 0% withdrawal fee, time-bound, revocable, for mid-high payments, document linking\n\n 33 CFGT'),
          _space(),
          PriceCard(
              title: 'Verifiable Document',
              description:
                  '\n\nVerifier filtering, revocable, Expirable, existance proof\n\n9 CFGT'),
          _space(),
          PriceCard(
              title: 'Escrow',
              description:
                  '\n\n1% withdrawal fee, time-bound, revocable, for low-mid payments\n\nArbitrum: 0.0029 ETH\nPolygon: 424.9 POL'),
          _space(),
          PriceCard(
              title: 'Document Registry',
              description:
                  '\n\nMulti-verifier, revocable, Expirable, existance proof\n\nArbitrum: 0.0019 ETH\nPolygon: 424.9 POL'),
          _space(),
          PriceCard(
              title: 'Asset Paywall',
              description:
                  '\n\nOn-chain payment, native token & stablecoin support\n\nArbitrum: 0.029 ETH\nPolygon: 424.9 POL')
        ],
      ),
    ));
  }
}
