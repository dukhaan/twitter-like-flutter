import 'package:auto_route/auto_route.dart';
import 'package:twitter_like/features/balasan/view/balasan_page.dart';
import 'package:twitter_like/features/kirim_fest/view/kirim_fest_page.dart';
import 'package:twitter_like/features/login/login.dart';
import 'package:twitter_like/features/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        CustomRoute(
          page: HomeRoute.page,
          path: '/home',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),

        CustomRoute(
          page: ProfileRoute.page,
          path: '/profile',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),

        CustomRoute(
          page: KirimFestRoute.page,
          path: '/kirim-fest',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),

        CustomRoute(
          page: BalasanRoute.page,
          path: '/balasan',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),

        CustomRoute(
          page: LoginRoute.page,
          path: '/login',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          initial: true,
        )
      ];
}
