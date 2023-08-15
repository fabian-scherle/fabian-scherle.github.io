import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactSection extends pw.StatelessWidget {
  /// https://github.com/google/material-design-icons/blob/master/font/MaterialIcons-Regular.codepoints
  final mailOutlineIcon = const pw.IconData(57569);
  final phoneIcon = const pw.IconData(57549);
  final locationPinIcon = const pw.IconData(61915);

  final textStyle = const pw.TextStyle(
    color: PdfColors.white,
    fontSize: 10,
  );
  final AppLocalizations appLocalizations;

  ContactSection({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        constraints: const pw.BoxConstraints.expand(height: 30),
        color: resumeMainColor,
        child:
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
          pw.Icon(mailOutlineIcon, size: 16, color: PdfColors.white),
          pw.Container(
              child: pw.Text(email, style: textStyle),
              margin: const pw.EdgeInsets.fromLTRB(5, 0, 10, 0)),
          pw.Icon(phoneIcon, size: 16, color: PdfColors.white),
          pw.Container(
              child: pw.Text(phoneNumber, style: textStyle),
              margin: const pw.EdgeInsets.fromLTRB(5, 0, 10, 0)),
          pw.Icon(locationPinIcon, size: 16, color: PdfColors.white),
          pw.Container(
              child: pw.Text(appLocalizations.currentLocation, style: textStyle),
              margin: const pw.EdgeInsets.fromLTRB(5, 0, 10, 0)),
        ]));
  }
}
