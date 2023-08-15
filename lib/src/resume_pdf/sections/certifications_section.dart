import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';
import 'package:portfolio/src/resume_pdf/data.dart';

class CertificationsSection extends pw.StatelessWidget {
  final AppLocalizations appLocalizations;

  CertificationsSection({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
              margin: const pw.EdgeInsets.only(top: 30, left: 20),
              child: pw.Text(appLocalizations.resumeCertifications,
                  style: resumeTitleText)),
          getCertificationsWidget(appLocalizations)
        ]);
  }

  pw.Widget getCertificationsWidget(AppLocalizations appLocalizations) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: getCertificationsList(appLocalizations).map((certification) {
          return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 12, left: 20),
                    child: pw.Text(certification.title,
                        style: resumeSubtitleText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 3, left: 20),
                    child: pw.Text(
                        certification.url,
                        style: urlText)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 3, left: 20),
                    child: pw.Text(
                        "${certification.dateFrom} - ${certification.dateTo}",
                        overflow: pw.TextOverflow.visible,
                        style: resumeSectionText))
              ]);
        }).toList());
  }

  pw.Widget urlButton(String url) {
    return pw.FlatButton(
      name: url,
      child: pw.Text("url"),
    );
  }
}
