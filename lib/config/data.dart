import 'package:portfolio/src/models/project_model.dart';

String backgroundImagePath = "assets/images/number_rain.gif";
String imagePath = "assets/images/profile.jpg";

//Link to resume
String resumeLink =
    "https://mega.nz/folder/1rxmzKAB#gseZdwMEK2JBH9WdYoUMfg";

String fullName = "Fabián Scherle Carboneres";
String phoneNumber = "+34 677 16 96 87";
String email = "fabianscherle99@gmail.com";
String linkedinUrl = "https://www.linkedin.com/in/fabi%C3%A1n-scherle-carboneres-5ba3831b5/";

List<Project> projectList = [
  Project(
      name: "BalHom",
      description:
          "Open source application for day-to-day expenses and revenues management.",
      imageUrl: "https://raw.githubusercontent.com/balhom/.github/main/balance_home_app.png",
      link: "https://github.com/balhom"),
  Project(
      name: "Currency Conversion API",
      description: "Currency Conversion API provides a convenient way to obtain currency conversion rates and historical conversion data for multiple currencies.",
      imageUrl: "https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png",
      link: "https://github.com/fabbo-repo/currency-conversion-api"),
  Project(
      name: "Wayat",
      description:
          "Demonstrator/MVP on how to use Flutter, Python (both devonfw incubators) and Google Cloud.",
      imageUrl: "https://raw.githubusercontent.com/devonfw-forge/wayat-flutter-python-mvp/main/wayat_icon.png",
      link: "https://github.com/devonfw-forge/wayat-flutter-python-mvp"),
  Project(
      name: "Hangar",
      description:
          "Packaging of documentation and tools needed to create a top-down DevOps (pre-made) environment.",
          imageUrl: "https://raw.githubusercontent.com/devonfw/hangar/takeoff_develop/takeoff/_docs/rocket_logo.png",
      link: "https://github.com/devonfw/hangar"),
  Project(
      name: "OpenSHS Inprovment",
      description: "New interaction mechanisms for Open Smart Home Simulator to generate simulated data in an easy way.",
      imageUrl: "https://raw.githubusercontent.com/fabbo-repo/openshs/master/img/logo.png",
      link: "https://github.com/fabbo-repo/openshs")
];
