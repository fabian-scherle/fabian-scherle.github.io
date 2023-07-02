import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends ConsumerWidget {
  final Project projectData;

  const ProjectCard({Key? key, required this.projectData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final screenSize = MediaQuery.of(context).size;
    final cardWidth = screenSize.width > 1000
        ? screenSize.width * 0.2
        : screenSize.width * 0.4;
    return SizedBox(
      height: 120,
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            leading: Image.network(projectData.imageUrl,
                width: 60,
                height: 60,
                filterQuality: FilterQuality.medium,
                fit: BoxFit.contain, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            }, errorBuilder: (_, o, ___) {
              debugPrint(o.toString());
              return const Icon(Icons.image);
            }),
            title: Row(
              children: [
                Icon(
                  Icons.build,
                  color: kGrey,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: cardWidth,
                  child: Text(
                    projectData.name,
                    style: kSectionTitleText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  projectData.description.length <= 203
                      ? projectData.description
                      : "${projectData.description.substring(0, 204)}...",
                  overflow: TextOverflow.visible),
            ),
          ),
          const Spacer(),
          const Divider(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () async {
                  //Launch project on GitHub
                  final Uri url = Uri.parse(projectData.link);
                  await launchUrl(url);
                },
                child: Text(
                  appLocalizations.viewProject,
                  style: kSubTitleText.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
