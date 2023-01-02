import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/providers.dart';
import 'package:portfolio/src/widgets/language_picker_dropdown.dart';

class ProfileImageContainer extends ConsumerWidget {
  const ProfileImageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(alignment: AlignmentDirectional.topEnd, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImagePath), fit: BoxFit.cover),
        ),
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
      ),
      CustomLanguagePickerDropdown(onValuePicked: (value) {
        ref
            .read(appLocalizationsProvider.notifier)
            .setLocale(Locale(value.isoCode));
      })
    ]);
  }
}
