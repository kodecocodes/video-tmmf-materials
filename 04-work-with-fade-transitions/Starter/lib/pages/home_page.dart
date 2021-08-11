import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_page.dart';
import '../widgets/article_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            OpenContainer(
              closedElevation: 4,
              transitionType: ContainerTransitionType.fadeThrough,
              tappable: false,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return GestureDetector(
                  onTap: () {
                    openContainer();
                    print('Container Opening...Do Something here...');
                  },
                  child: ArticleCard(article: articles[index]),
                );
              },
              openBuilder: (
                BuildContext _,
                CloseContainerActionCallback closeContainer,
              ) {
                return ArticlePage(
                  article: articles[index],
                );
              },
              onClosed: (result) {
                print('Container closed');
                print('We can reload the list of articles here');
                print(result);
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
