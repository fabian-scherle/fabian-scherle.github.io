import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const PdfColor resumeMainColor = PdfColors.blueGrey900;

const PdfColor resumeTitleColor = PdfColors.blueGrey600;

pw.TextStyle resumeTitleText = pw.TextStyle(
    color: resumeTitleColor,
    fontSize: 16,
    decoration: pw.TextDecoration.underline,
    fontWeight: pw.FontWeight.bold);

pw.TextStyle resumeSubtitleText = pw.TextStyle(
    color: PdfColors.black,
    fontSize: 14,
    fontWeight: pw.FontWeight.bold,
    decorationStyle: pw.TextDecorationStyle.solid);

pw.TextStyle resumeSndSubtitleText = const pw.TextStyle(
    color: PdfColors.black,
    fontSize: 12,
    decorationStyle: pw.TextDecorationStyle.solid);

pw.TextStyle resumeNormalText =
    const pw.TextStyle(color: PdfColors.black, fontSize: 11);

pw.TextStyle resumeSectionText = pw.TextStyle(
    color: PdfColors.blueGrey400, fontSize: 11, fontStyle: pw.FontStyle.italic);
