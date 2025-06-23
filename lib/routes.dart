import 'package:contract_foundry_landing_page/pages/contract_page/contract_loader_page.dart';
import 'package:contract_foundry_landing_page/pages/contract_page/view.dart';
import 'package:contract_foundry_landing_page/pages/faq_page/view.dart';
import 'package:contract_foundry_landing_page/pages/landing_page_view/view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return LandingPageView();
      }),
  // GoRoute(
  //     path: '/faq',
  //     name: 'faq',
  //     builder: (context, state) {
  //       return FAQPageView();
  //     }),
  // GoRoute(
  //     path: '/contract/:did',
  //     name: 'contract',
  //     builder: (context, state) => ContarctPageView(
  //           contractDID: state.pathParameters['did'] ?? '',
  //         )),
  GoRoute(
      path: '/contract',
      name: 'contract_loader_page',
      builder: (context, state) => ContractLoaderPage()),
]);
