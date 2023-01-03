import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';
import 'package:portfolio/src/resume_pdf/data.dart';

class EducationSection extends pw.StatelessWidget {
  final AppLocalizations appLocalizations;

  EducationSection({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
              margin: const pw.EdgeInsets.only(top: 20, left: 20),
              child: pw.Text(appLocalizations.resumeEducation,
                  style: resumeTitleText)),
          getEducationWidget(appLocalizations)
        ]);
  }

  pw.Widget getEducationWidget(AppLocalizations appLocalizations) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: getEducationList(appLocalizations).map((e) {
          return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 8, left: 20),
                    child: pw.Text(e.title, style: resumeSubtitleText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 1, left: 20),
                    child: pw.Text(e.place, style: resumeSndSubtitleText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 3, left: 20),
                    child: pw.Text("${e.dateFrom} - ${e.dateTo}",
                        style: resumeSectionText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 5, left: 20),
                    child: pw.Text(appLocalizations.resumeDetails,
                        style: resumeSectionText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 2, left: 20),
                    child: getDetails(e.details)),
              ]);
        }).toList());
  }

  pw.Widget getDetails(List<String> details) {
    if (details.isEmpty) return pw.Container();
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: details
            .map((e) => pw.Row(children: [
                  pw.Container(
                    width: 5,
                    height: 5,
                    margin: const pw.EdgeInsets.only(top: 4, right: 2),
                    decoration: const pw.BoxDecoration(
                      color: resumeTitleColor,
                      shape: pw.BoxShape.circle,
                    ),
                  ),
                  pw.Container(
                      margin: const pw.EdgeInsets.only(top: 5),
                      child: pw.Text(e, style: resumeNormalText))
                ]))
            .toList());
  }
}
