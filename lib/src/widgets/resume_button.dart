import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/src/providers.dart';
import 'package:portfolio/src/resume_pdf/resume_pdf.dart';

class ResumeButton extends ConsumerWidget {
  const ResumeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return OutlinedButton(
        onPressed: () async {
          await ResumePDF.showPdf(appLocalizations);
        },
        child: Text(
          appLocalizations.viewResume,
          style: kSubTitleText,
        ));
  }
}
