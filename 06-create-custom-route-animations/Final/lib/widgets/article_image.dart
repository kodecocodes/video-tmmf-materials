import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String? urlToImage;
  const ArticleImage(this.urlToImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            '$urlToImage',
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, -0.8),
                colors: <Color>[Color(0x60000000), Color(0x00000000)],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: MediaQuery.of(context).padding.left,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
