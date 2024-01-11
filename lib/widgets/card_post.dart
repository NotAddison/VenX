import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final String image;
  final String author;
  final String date;

  const PostCard({
    Key? key,
    required this.title,
    required this.body,
    required this.image,
    required this.author,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 20.0;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 1,
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  // Image
                  ImageWidget(image: image),

                  // Spacing
                  const SizedBox(width: 10),

                  // Post content
                  Expanded(
                    child: PostContentWidget(
                      title: title,
                      body: body,
                      author: author,
                      date: date,
                    ),
                  ),

                  // Spacing
                  const SizedBox(width: 10),

                  // Action buttons
                  const ActionButtonsWidget(iconSize: iconSize),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String image;

  const ImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // get max width and height
      width: 150,
      height: 150,

      // image
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }
}

class PostContentWidget extends StatelessWidget {
  final String title;
  final String body;
  final String author;
  final String date;

  const PostContentWidget({
    super.key,
    required this.title,
    required this.body,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Title
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        // Line divider
        const Divider(
          color: Color.fromARGB(255, 202, 202, 202),
        ),

        // Body container
        SizedBox(
          height: 80,
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            body,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Author and date
        Text(
          '$author - $date',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ActionButtonsWidget extends StatelessWidget {
  final double iconSize;

  const ActionButtonsWidget({super.key, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Like button
        IconButton(
          icon: Icon(
            Icons.favorite_border_outlined,
            size: iconSize,
            color: Colors.black45,
          ),
          onPressed: () {},
        ),

        // Spacing
        const SizedBox(height: 10),

        // Bookmark
        IconButton(
          icon: Icon(
            Icons.bookmark_border_outlined,
            size: iconSize,
            color: Colors.black45,
          ),
          onPressed: () {},
        ),

        // Spacing
        const SizedBox(height: 10),

        // Share
        IconButton(
          icon: Icon(
            Icons.share_outlined,
            size: iconSize,
            color: Colors.black45,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
