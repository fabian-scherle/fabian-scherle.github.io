import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/resume_pdf/contact_section.dart';
import 'package:portfolio/src/resume_pdf/education_section.dart';
import 'package:portfolio/src/resume_pdf/experience_section.dart';
import 'package:portfolio/src/resume_pdf/languages_section.dart';
import 'package:portfolio/src/resume_pdf/profile_section.dart';
import 'package:portfolio/src/resume_pdf/skills_sections.dart';
import 'package:printing/printing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResumePDF extends pw.StatelessWidget {
  final pw.ImageProvider image;
  final AppLocalizations appLocalizations;

  ResumePDF({required this.image, required this.appLocalizations});

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
                  EducationSection(appLocalizations: appLocalizations),
                  SkillsSection(appLocalizations: appLocalizations)
                ]),
            pw.SizedBox(width: 30),
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  ExperienceSection(appLocalizations: appLocalizations),
                  LanguagesSection(appLocalizations: appLocalizations)
                ])
          ])
    ]));
  }

  static Future<pw.ImageProvider> fetchImage() async {
    return await imageFromAssetBundle(imagePath);
  }

  static Future<void> showPdf(AppLocalizations appLocalizations) async {
    final pdf = pw.Document();
    final image = await fetchImage();
    pdf.addPage(pw.Page(
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.openSansRegular(),
          bold: await PdfGoogleFonts.openSansBold(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        pageFormat: PdfPageFormat.a4.copyWith(
            marginBottom: 0, marginLeft: 0, marginRight: 0, marginTop: 0),
        build: (pw.Context context) {
          return ResumePDF(image: image, appLocalizations: appLocalizations);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
