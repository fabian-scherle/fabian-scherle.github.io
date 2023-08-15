import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/src/resume_pdf/sections/certifications_section.dart';
import 'package:portfolio/src/resume_pdf/sections/contact_section.dart';
import 'package:portfolio/src/resume_pdf/sections/experience_section.dart';
import 'package:portfolio/src/resume_pdf/sections/languages_section.dart';
import 'package:portfolio/src/resume_pdf/sections/profile_section.dart';
import 'package:portfolio/src/resume_pdf/sections/skills_sections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstPage extends pw.StatelessWidget {
  final pw.ImageProvider image;
  final AppLocalizations appLocalizations;

  FirstPage({required this.image, required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Expanded(
        child: pw.Column(children: [
      ProfileSection(image: image, appLocalizations: appLocalizations),
      ContactSection(appLocalizations: appLocalizations),
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
                  SkillsSection(appLocalizations: appLocalizations),
                ]),
            pw.SizedBox(width: 30),
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  ExperienceSection(appLocalizations: appLocalizations),
                ])
          ])
    ]));
  }

}
