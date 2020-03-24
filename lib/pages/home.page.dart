import 'package:flutter/material.dart';
import 'package:flutterblog/pages/details.page.dart';
import 'package:flutterblog/post.repository.dart';
import 'package:flutterblog/models/post.model.dart';

class HomePage extends StatelessWidget {
    var repository = new PostRepository();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: FutureBuilder(
        future: repository.getAll(),
        builder: (context, snp) {
          if(snp.hasData){
            List<Post> posts = snp.data;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(posts[i].title),
                  subtitle: Text(posts[i].author.name),
                  onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => DetailsPage(
                          tag: posts[i].meta.url,
                        ),
                      )
                    );
                  },
                );
              },
            );
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