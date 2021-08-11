import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_page.dart';
import '../widgets/article_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (context) => ArticlePage(
                  article: articles[index],
                ),
              ),
            );
          },
          child: ArticleCard(article: articles[index]),
        );
      },
    );
  }
}
