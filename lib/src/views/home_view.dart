import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/providers.dart';
import 'package:portfolio/src/widgets/contact_button.dart';
import 'package:portfolio/src/widgets/profile_image_container.dart';
import 'package:portfolio/src/widgets/project_widget.dart';
import 'package:portfolio/src/widgets/resume_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImageContainer(),
            Center(
                child: Text(
              appLocalizations.name,
              style: kTitleText,
            )),
            space1(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const ResumeButton(), space2(), const ContactButton()],
            ),
            space1(),
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
                                experienceTitle(appLocalizations),
                                space1(),
                                Text(appLocalizations.aboutWorkExperience),
                                const Divider(),
                                aboutMeTitle(appLocalizations),
                                space1(),
                                Text(appLocalizations.aboutMeSummary),
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
                                          space1(),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                size: 16,
                                              ),
                                              space2(),
                                              Text(
                                                location,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          space1(),
                                          phoneNumberTitle(appLocalizations),
                                          space1(),
                                          Text(
                                            phoneNumber,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          space1(),
                                          emailTitle(appLocalizations),
                                          space1(),
                                          Text(
                                            email,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          space1(),
                                          Row(
                                            children: [
                                              linkedinUrlTitle(
                                                  appLocalizations),
                                              space2(),
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
                                          space1(),
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
                              experienceTitle(appLocalizations),
                              space1(),
                              Text(appLocalizations.aboutWorkExperience),
                              const Divider(),
                              aboutMeTitle(appLocalizations),
                              space1(),
                              Text(appLocalizations.aboutMeSummary),
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
                                        space1(),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              size: 16,
                                            ),
                                            space2(),
                                            Text(
                                              location,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                        space1(),
                                        phoneNumberTitle(appLocalizations),
                                        space1(),
                                        Text(
                                          phoneNumber,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        space1(),
                                        emailTitle(appLocalizations),
                                        space1(),
                                        Text(
                                          email,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        space1(),
                                        Row(
                                          children: [
                                            linkedinUrlTitle(appLocalizations),
                                            space2(),
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
                                        space1(),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: screenSize.width > 1000
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 3),
                        itemCount: projectList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectWidget(
                            projectData: projectList[index],
                          );
                        })
                    : GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 2),
                        itemCount: projectList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectWidget(
                            projectData: projectList[index],
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget space1() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget space2() {
    return const SizedBox(
      width: 5,
    );
  }

  Text experienceTitle(AppLocalizations appLocalizations) {
    return Text(
      appLocalizations.experience,
      style: kSectionTitleText,
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
