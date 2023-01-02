import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/router.dart';
import 'package:portfolio/src/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PortafolioApp extends ConsumerStatefulWidget {
  const PortafolioApp({super.key});

  @override
  PortafolioAppState createState() => PortafolioAppState();
}

class PortafolioAppState extends ConsumerState<PortafolioApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        onGenerateTitle: (context) {
          // In the app build, the context does not contain an AppLocalizations instance.
          // However, at the moment the title is ggoing to be generated
          // the AppLocalizations instance is not null
          final appLocalizations = ref.read(appLocalizationsProvider);
          return appLocalizations.appTitle;
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router);
  }
}
