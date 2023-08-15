import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationModel {
  final String title;
  final String place;
  final String dateFrom;
  final String dateTo;
  final List<String> details;

  EducationModel(
      {required this.title,
      required this.place,
      required this.dateFrom,
      required this.dateTo,
      required this.details});
}

class ExperienceModel {
  final String title;
  final String place;
  final String dateFrom;
  final String dateTo;
  final List<String> tasks;

  ExperienceModel(
      {required this.title,
      required this.place,
      required this.dateFrom,
      required this.dateTo,
      required this.tasks});
}

class CertificationModel {
  final String title;
  final String url;
  final String dateFrom;
  final String dateTo;

  CertificationModel(
      {required this.title,
      required this.url,
      required this.dateFrom,
      required this.dateTo});
}

List<EducationModel> getEducationList(AppLocalizations appLocalizations) {
  return [
    EducationModel(
        title: appLocalizations.educationTitle1,
        place: appLocalizations.educationPlace1,
        dateFrom: appLocalizations.educationDateFrom1,
        dateTo: appLocalizations.educationDateTo1,
        details: [
          appLocalizations.educationDetails11,
          appLocalizations.educationDetails12,
          appLocalizations.educationDetails13,
          appLocalizations.educationDetails14
        ]),
    EducationModel(
        title: appLocalizations.educationTitle2,
        place: appLocalizations.educationPlace2,
        dateFrom: appLocalizations.educationDateFrom2,
        dateTo: appLocalizations.educationDateTo2,
        details: [
          appLocalizations.educationDetails21,
          appLocalizations.educationDetails22,
          appLocalizations.educationDetails23,
          appLocalizations.educationDetails24,
          appLocalizations.educationDetails25
        ]),
    EducationModel(
        title: "",
        place: appLocalizations.educationPlace3,
        dateFrom: appLocalizations.educationDateFrom3,
        dateTo: appLocalizations.educationDateTo3,
        details: [
          appLocalizations.educationDetails31,
          appLocalizations.educationDetails32,
        ]),
  ];
}

List<CertificationModel> getCertificationsList(
    AppLocalizations appLocalizations) {
  return [
    CertificationModel(
      title: appLocalizations.certificationTitle1,
      url: "https://www.credential.net/\ne96b7cf2-a1c1-4476-91c2-8fdba17131a0",
      dateFrom: appLocalizations.certificationDateFrom1,
      dateTo: appLocalizations.certificationDateTo1,
    )
  ];
}

List<ExperienceModel> getExperienceList(AppLocalizations appLocalizations) {
  return [
    ExperienceModel(
        title: appLocalizations.experienceTitle1,
        place: appLocalizations.experiencePlace1,
        dateFrom: appLocalizations.experienceDateFrom1,
        dateTo: appLocalizations.experienceDateTo1,
        tasks: [
          appLocalizations.experienceTasks11,
          appLocalizations.experienceTasks12
        ]),
    ExperienceModel(
        title: appLocalizations.experienceTitle2,
        place: appLocalizations.experiencePlace2,
        dateFrom: appLocalizations.experienceDateFrom2,
        dateTo: appLocalizations.experienceDateTo2,
        tasks: [appLocalizations.experienceTasks21]),
    ExperienceModel(
        title: appLocalizations.experienceTitle3,
        place: appLocalizations.experiencePlace3,
        dateFrom: appLocalizations.experienceDateFrom3,
        dateTo: appLocalizations.experienceDateTo3,
        tasks: [
          appLocalizations.experienceTasks31,
          appLocalizations.experienceTasks32,
          appLocalizations.experienceTasks33,
          appLocalizations.experienceTasks34
        ]),
  ];
}

Map<String, String> getLanuagesList(AppLocalizations appLocalizations) {
  return {
    appLocalizations.english: "B1",
    appLocalizations.french: "A2",
    appLocalizations.spanish: appLocalizations.native
  };
}

List<String> getSkillsList(AppLocalizations appLocalizations) {
  return [
    appLocalizations.skillCommunication,
    appLocalizations.skillLeadership,
    appLocalizations.skillEmpathy,
    "Docker",
    "Kubernetes",
    "Python",
    "Django/DRF",
    "Java",
    "Spring",
    "Rust",
    "Actix",
    "GCP",
    "Firebase",
    "AWS",
    "Linux",
    "Ansi C",
    "C++",
    "Dart",
    "Flutter",
    "CSS",
    "HTML",
    "TypeScript",
    "Angular",
    "Scrum",
    "Agile",
    "Git",
    "Gitlab",
    "Github"
  ];
}
