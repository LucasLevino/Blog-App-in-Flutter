import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutterblog/post.repository.dart';

class DetailsPage extends StatelessWidget {
  final String tag;
  final repository = new PostRepository();

  DetailsPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tag),
      ),
      body: FutureBuilder(
        future: repository.getPostBody(tag),
        builder: (ctx, snp) {
          if (snp.hasData){
            String data = snp.data;

            return Markdown(data: data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}