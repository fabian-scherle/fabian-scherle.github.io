import 'package:flutter/material.dart';
import 'package:portfolio/config/data.dart';
import 'package:portfolio/src/widgets/project_card.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return cardsGrid(context);
  }

  Widget cardsGrid(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List<Widget> column1 = [];
    final List<Widget> column2 = [];
    for (int i = 0; i < projectList.length; i++) {
      if (screenSize.width > 1000) {
        if (i % 2 == 0) {
          column1.add(
            ProjectCard(
              projectData: projectList[i],
            ),
          );
        } else {
          column2.add(
            ProjectCard(
              projectData: projectList[i],
            ),
          );
        }
      } else {
        column1.add(
          ProjectCard(
            projectData: projectList[i],
          ),
        );
      }
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (column1.isNotEmpty)
            Column(
              children: column1,
            ),
          if (column2.isNotEmpty)
            Column(
              children: column2,
            ),
        ],
      ),
    );
  }
}
