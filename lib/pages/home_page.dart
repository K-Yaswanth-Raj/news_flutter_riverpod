import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/loading.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/search_field.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NEWS',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchField(),
            SizedBox(
                width: 400,
                child: Divider(
                  height: 25,
                  color: Colors.teal,
                )),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: loading(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: news.results!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCard(results: news.results![index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
