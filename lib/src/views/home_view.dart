import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/providers.dart';
import 'package:portfolio/src/widgets/contact_button.dart';
import 'package:portfolio/src/widgets/profile_image_container.dart';
import 'package:portfolio/src/widgets/projects_section_widget.dart';
import 'package:portfolio/src/widgets/resume_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImageContainer(),
            spaceHeight10(),
            Center(
                child: Text(appLocalizations.name,
                    style: kTitleText, textAlign: TextAlign.center)),
            spaceHeight10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ResumeButton(),
                spaceWidth5(),
                const ContactButton()
              ],
            ),
            spaceHeight10(),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: screenSize.width > 1200
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                aboutMeTitle(appLocalizations),
                                spaceHeight10(),
                                Text(appLocalizations.aboutMeSummary),
                                spaceHeight10(),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 40),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          locationTitle(appLocalizations),
                                          spaceHeight10(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                size: 16,
                                              ),
                                              spaceWidth5(),
                                              Text(
                                                appLocalizations
                                                    .currentLocation,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          spaceHeight10(),
                                          phoneNumberTitle(appLocalizations),
                                          spaceHeight10(),
                                          Text(
                                            phoneNumber,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          spaceHeight10(),
                                          emailTitle(appLocalizations),
                                          spaceHeight10(),
                                          Text(
                                            email,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          spaceHeight10(),
                                          Row(
                                            children: [
                                              linkedinUrlTitle(
                                                  appLocalizations),
                                              spaceWidth5(),
                                              IconButton(
                                                  onPressed: () async {
                                                    final Uri uri = Uri.parse(
                                                      linkedinUrl,
                                                    );
                                                    await launchUrl(uri);
                                                  },
                                                  icon: const Icon(
                                                    Icons.launch,
                                                    size: 16,
                                                  ))
                                            ],
                                          ),
                                          spaceHeight10(),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              aboutMeTitle(appLocalizations),
                              spaceHeight10(),
                              Text(appLocalizations.aboutMeSummary),
                              spaceHeight10(),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        locationTitle(appLocalizations),
                                        spaceHeight10(),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              size: 16,
                                            ),
                                            spaceWidth5(),
                                            Text(
                                              appLocalizations.currentLocation,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                        spaceHeight10(),
                                        phoneNumberTitle(appLocalizations),
                                        spaceHeight10(),
                                        Text(
                                          phoneNumber,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        spaceHeight10(),
                                        emailTitle(appLocalizations),
                                        spaceHeight10(),
                                        Text(
                                          email,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        spaceHeight10(),
                                        Row(
                                          children: [
                                            linkedinUrlTitle(appLocalizations),
                                            spaceWidth5(),
                                            IconButton(
                                                onPressed: () async {
                                                  final Uri uri = Uri.parse(
                                                    linkedinUrl,
                                                  );
                                                  await launchUrl(uri);
                                                },
                                                icon: const Icon(
                                                  Icons.launch,
                                                  size: 16,
                                                ))
                                          ],
                                        ),
                                        spaceHeight10(),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            const ProjectsSectionWidget(),
            spaceHeight10()
          ],
        ),
      ),
    );
  }

  Text aboutMeTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.aboutMe,
      style: kSectionTitleText,
    );
  }

  Text locationTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.location,
      style: kSubTitleText,
    );
  }

  Text phoneNumberTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.phoneNumber,
      style: kSubTitleText,
    );
  }

  Text emailTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.email,
      style: kSubTitleText,
    );
  }

  Text linkedinUrlTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.linkedin,
      style: kSubTitleText,
    );
  }
}
