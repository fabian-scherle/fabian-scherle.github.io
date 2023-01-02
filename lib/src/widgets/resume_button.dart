import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeButton extends ConsumerWidget {
  const ResumeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return OutlinedButton(
        onPressed: () async {
          //Code to launch resume
          await launchUrl(Uri.parse(resumeLink));
        },
        child: Text(
          appLocalizations.viewResume,
          style: kSubTitleText,
        ));
  }
}
