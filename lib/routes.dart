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
            title: 'Privacy Policy',
          )),
  GoRoute(
      path: '/terms',
      name: 'terms',
      builder: (context, state) => MDDocPageView(
            docPath: 'assets/docs/tos',
            title: 'Terms of Service',
          )),
]);
