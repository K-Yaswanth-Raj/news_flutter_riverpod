import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_app/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final Results results;
  const NewsCard({super.key, required this.results});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2.0, left: 14, right: 14, bottom: 4),
          child: SizedBox(
            height: 130,
            child: Card(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: results.imageUrl.toString(),
                        errorWidget: (context, url, error) {
                          return Icon(Icons.error);
                        },
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: VerticalDivider(
                      color: Colors.teal,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        results.title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
