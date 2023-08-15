import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';
import 'package:portfolio/src/resume_pdf/data.dart';

class LanguagesSection extends pw.StatelessWidget {
  final AppLocalizations appLocalizations;

  LanguagesSection({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
              margin: const pw.EdgeInsets.only(top: 40, left: 20),
              child: pw.Text(appLocalizations.resumeLanguage,
                  style: resumeTitleText)),
          getLanguagesWidget(appLocalizations)
        ]);
  }

  pw.Widget getLanguagesWidget(AppLocalizations appLocalizations) {
    final languages = getLanuagesList(appLocalizations);
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: languages.keys.map((e) {
          return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(children: [
                  pw.Container(
                      margin: const pw.EdgeInsets.only(top: 5, left: 20),
                      child: pw.Text(e, style: resumeSndSubtitleText)),
                  pw.Container(
                      margin: const pw.EdgeInsets.only(top: 5, left: 10),
                      child: pw.Text(languages[e]!, style: resumeSectionText))
                ])
              ]);
        }).toList());
  }
}
