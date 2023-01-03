import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/resume_pdf/constants.dart';
import 'package:portfolio/src/resume_pdf/data.dart';

class SkillsSection extends pw.StatelessWidget {
  final AppLocalizations appLocalizations;

  SkillsSection({required this.appLocalizations});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
              margin: const pw.EdgeInsets.only(top: 20, left: 20),
              child: pw.Text(appLocalizations.resumeSkills,
                  style: resumeTitleText)),
          getSkillsWidget(appLocalizations)
        ]);
  }

  pw.Widget getSkillsWidget(AppLocalizations appLocalizations) {
    final skills = getSkillsList(appLocalizations);
    List<List<String>> aux = [];
    int sumAux = 0;
    for (int i = 0; i < skills.length; i++) {
      if (sumAux + skills[i].length > 30) {
        sumAux = skills[i].length;
        aux.add([skills[i]]);
      } else {
        sumAux += skills[i].length;
        if (aux.isEmpty) aux.add([]);
        aux.last.add(skills[i]);
      }
    }
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: aux.map((l) {
          return pw.Row(
              children: l.map((e) {
            return pw.Container(
                margin: const pw.EdgeInsets.all(3),
                padding: const pw.EdgeInsets.all(3),
                color: PdfColors.blueGrey300,
                child: pw.Text(e, style: resumeNormalText));
          }).toList());
        }).toList());
  }
}
