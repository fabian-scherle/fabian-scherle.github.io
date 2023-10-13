import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/src/resume_pdf/sections/certifications_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/sections/languages_section.dart';
import 'package:portfolio/src/resume_pdf/sections/skills_sections.dart';

class SecondPage extends pw.StatelessWidget {
  final AppLocalizations appLocalizations;

  SecondPage({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Expanded(
        child: pw.Column(children: [
      pw.Container(
        height: 30,
        color: PdfColors.blueGrey,
      ),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  LanguagesSection(appLocalizations: appLocalizations),
                  CertificationsSection(appLocalizations: appLocalizations),
                ]),
            pw.SizedBox(width: 30),
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  SkillsSection(appLocalizations: appLocalizations),
                ])
          ])
    ]));
  }
}
