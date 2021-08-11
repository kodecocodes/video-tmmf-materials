import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article? article;

  const ArticleCard({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        return isTablet
            ? WideCard(article: article)
            : TallCard(article: article);
      },
    );
  }
}

class TallCard extends StatelessWidget {
  final Article? article;

  const TallCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardBanner(imageUrl: article!.urlToImage),
        CardDetail(article: article),
      ],
    );
  }
}

class WideCard extends StatelessWidget {
  final Article? article;

  const WideCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CardBanner(
          imageUrl: article!.urlToImage,
          isWideCard: true,
        ),
        Expanded(
          child: CardDetail(article: article),
        ),
      ],
    );
  }
}

class CardDetail extends StatelessWidget {
  final Article? article;

  const CardDetail({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPortrait ? 130 : 150,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            article!.title,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // SizedBox(height: 16),
          Row(
            children: <Widget>[
              Text(article!.source),
              const Spacer(),
              const Text('45 Comments'),
            ],
          )
        ],
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  final String? imageUrl;
  final bool isWideCard;

  const CardBanner({Key? key, this.imageUrl, this.isWideCard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          child: SizedBox(
            height: isWideCard ? 150 : 200,
            width: isWideCard ? 150 : double.infinity,
            child: Image.asset(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: isWideCard ? 2 : 10,
          right: isWideCard ? 2 : 10,
          child: IconButton(
            icon: const Icon(Icons.bookmark_border, size: 32),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
