import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/config/router.dart';
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
        title: fullName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router);
  }
}
