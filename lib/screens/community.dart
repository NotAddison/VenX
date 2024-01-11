import 'package:flutter/material.dart';
import '../widgets/sub_base.dart';

// community post card
import '../widgets/card_post.dart';

import '../utils/requests.dart';
import '../models/post_schema.dart';

class Community extends StatefulWidget {
  const Community({super.key});
  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  Future<List<Widget>> render() async {
    List<Post> posts = await getPosts();
    var widgets = <Widget>[];
    for (var i = 0; i < posts.length; i++) {
      widgets.add(PostCard(
        title: posts[i].title,
        body: posts[i].body,
        image: posts[i].image,
        author: posts[i].author,
        date: posts[i].date,
      ));
    }
    return widgets + [const SizedBox(height: 50)];
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      showNavBar: false,
      title: "Community Space",
      body: FutureBuilder<List<Widget>>(
        future: render(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator while waiting for the data
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Return an error message if an error occurs
            return Text('Error: ${snapshot.error}');
          } else {
            // Return the list of widgets when the data is available
            return SingleChildScrollView(
              clipBehavior: Clip.none,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: snapshot.data ?? const <Widget>[],
              ),
            );
          }
        },
      ),
    );
  }
}
