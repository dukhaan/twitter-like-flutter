import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_like/core/app_theme_data.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/l10n/app_localization.dart';
import 'package:twitter_like/routes/router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MainApp());
}

final appRouter = AppRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return GlobalLoaderOverlay(
        useDefaultLoading: false,
        closeOnBackButton: true,
        overlayWidgetBuilder: (_) {
          return const Center(
              child: SpinKitChasingDots(
            color: ColorValues.primary50,
            size: 50.0,
          ));
        },
        child: MaterialApp.router(
          theme: AppThemeData.getTheme(context),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}
