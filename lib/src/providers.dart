import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/states/app_localizations_state.dart';
import 'package:universal_io/io.dart';

final appLocalizationsProvider =
    StateNotifierProvider<AppLocalizationsState, AppLocalizations>((ref) {
  Locale locale = Locale(Platform.localeName.substring(0, 2));
  // If system's locale is not supported, Enlish will be used as default
  if (!AppLocalizations.supportedLocales.contains(locale)) {
    locale = const Locale("en");
  }
  return AppLocalizationsState(lookupAppLocalizations(locale));
});