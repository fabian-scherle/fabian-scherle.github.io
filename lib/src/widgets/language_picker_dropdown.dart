import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:portfolio/src/providers.dart';

class CustomLanguagePickerDropdown extends ConsumerWidget {
  final void Function(Language) onValuePicked;

  const CustomLanguagePickerDropdown({required this.onValuePicked, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Container(
      color: const Color.fromARGB(163, 190, 190, 190),
      constraints: const BoxConstraints(maxWidth: 80),
      child: LanguagePickerDropdown(
          itemBuilder: (language) {
            return Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: _getFlag(language.isoCode)),
            ]);
          },
          initialValue: Language(appLocalizations.localeName,
              _getLangName(appLocalizations.localeName, appLocalizations)),
          languages: AppLocalizations.supportedLocales
              .map((e) => Language(e.languageCode,
                  _getLangName(e.languageCode, appLocalizations)))
              .toList(),
          onValuePicked: onValuePicked),
    );
  }

  String _getLangName(String code, AppLocalizations appLocalizations) {
    switch (code) {
      case "es":
        return appLocalizations.spanish;
      case "en":
        return appLocalizations.english;
      case "fr":
        return appLocalizations.french;
      default:
        return appLocalizations.unknown;
    }
  }

  Widget _getFlag(String code) {
    switch (code) {
      case "es":
        return const Flag.fromString("es", height: 15, width: 15);
      case "en":
        return const Flag.fromString("gb", height: 15, width: 15);
      case "fr":
        return const Flag.fromString("fr", height: 15, width: 15);
      default:
        return Container();
    }
  }
}
