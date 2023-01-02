import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends ConsumerWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return ElevatedButton(
        onPressed: () async {
          //Call to launch email
          final Uri emailLaunchUri = Uri(
            scheme: 'mailto',
            path: contactEmail,
          );
          await launchUrl(emailLaunchUri);
        },
        child: Row(
          children: [
            const Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              appLocalizations.contact,
              style: kSubTitleText.copyWith(color: Colors.white),
            )
          ],
        ));
  }
}
