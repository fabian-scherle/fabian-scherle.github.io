import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/config/data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';

class ProfileSection extends pw.StatelessWidget {
  final pw.ImageProvider image;
  final AppLocalizations appLocalizations;

  ProfileSection({required this.image, required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    String resumeReview = "";
    final List<String> resumeReviewWords = appLocalizations.resumeReview.split(" ");
    int lines = 1;
    for (String element in resumeReviewWords) {
      if ("$resumeReview $element".length >= 89 * lines) {
        lines++;
        if (lines >= 4) break;
        resumeReview += "\n$element ";
      } else {
        resumeReview += "$element ";
      }
    }

    return pw.Container(
        constraints: const pw.BoxConstraints.expand(height: 130),
        color: PdfColors.blueGrey,
        child: pw.Row(children: [
          pw.Container(
            margin: const pw.EdgeInsets.all(20),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: resumeMainColor, width: 3),
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(45)),
              image: pw.DecorationImage(image: image, fit: pw.BoxFit.cover),
            ),
            width: 90,
            height: 90,
          ),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    child: pw.Text(fullName,
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 24,
                            fontWeight: pw.FontWeight.bold)),
                    margin: const pw.EdgeInsets.fromLTRB(5, 20, 0, 0)),
                pw.Container(
                    child: pw.Text(appLocalizations.resumeRole,
                        style: pw.TextStyle(
                            color: resumeMainColor,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 13)),
                    margin: const pw.EdgeInsets.fromLTRB(15, 5, 0, 0)),
                pw.Container(
                    // No more than 3 lines with 89 characters each lines
                    child: pw.Text(resumeReview,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 10)),
                    margin: const pw.EdgeInsets.fromLTRB(5, 7, 0, 0)),
              ])
        ]));
  }
}
