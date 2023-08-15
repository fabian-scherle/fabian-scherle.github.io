import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/resume_pdf/pages/first_page_pdf.dart';
import 'package:portfolio/src/resume_pdf/pages/second_page_pdf.dart';
import 'package:printing/printing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResumePDF {
  static Future<pw.ImageProvider> fetchImage() async {
    return await imageFromAssetBundle(imagePath);
  }

  static Future<void> showPdf(AppLocalizations appLocalizations) async {
    final pdf = pw.Document();
    final image = await fetchImage();
    // First page
    pdf.addPage(pw.Page(
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.openSansRegular(),
          bold: await PdfGoogleFonts.openSansBold(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        pageFormat: PdfPageFormat.a4.copyWith(
            marginBottom: 0, marginLeft: 0, marginRight: 0, marginTop: 0),
        build: (pw.Context context) {
          return FirstPage(image: image, appLocalizations: appLocalizations);
        }));
    // Second page
    pdf.addPage(pw.Page(
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.openSansRegular(),
          bold: await PdfGoogleFonts.openSansBold(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        pageFormat: PdfPageFormat.a4.copyWith(
            marginBottom: 0, marginLeft: 0, marginRight: 0, marginTop: 0),
        build: (pw.Context context) {
          return SecondPage(appLocalizations: appLocalizations);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
