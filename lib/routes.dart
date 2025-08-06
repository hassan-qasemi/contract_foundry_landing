import 'package:contract_foundry_landing_page/pages/contract_page/contract_loader_page.dart';
import 'package:contract_foundry_landing_page/pages/contract_page/view.dart';
import 'package:contract_foundry_landing_page/pages/md_page/view.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return LandingPageView();
      }),
  GoRoute(
      path: '/contract/:did',
      name: 'contract',
      builder: (context, state) => ContractPageView(
            contractDID: state.pathParameters['did'] ?? '',
          )),
  GoRoute(
      path: '/privacy',
      name: 'privacy',
      builder: (context, state) => MDDocPageView(
            docPath: 'assets/docs/privacy',
            title: 'Privacy and Policy',
          )),
  GoRoute(
      path: '/tos',
      name: 'tos',
      builder: (context, state) => MDDocPageView(
            docPath: 'assets/docs/tos',
            title: 'Terms of Service',
          )),
  GoRoute(
      path: '/contract',
      name: 'contract_loader_page',
      builder: (context, state) => ContractLoaderPage()),
]);
