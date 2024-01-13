import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/post_schema.dart';

class FullPost extends StatefulWidget {
  final Post post;
  const FullPost({super.key, required this.post});

  @override
  State<FullPost> createState() => _FullPostState();
}

class _FullPostState extends State<FullPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          // Pop the page
          Navigator.pop(context);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
            // Center Container
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.post.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Author
                    Text(
                      widget.post.author,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    // Date
                    Text(
                      widget.post.date,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    // Spacer
                    const SizedBox(height: 20),

                    // Image + Dropshadow
                    Container(
                      width: double.maxFinite,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(31, 0, 0, 0),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.post.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Spacer
                    const SizedBox(height: 30),

                    // Body + Scrollable
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          // Add "\n" to the end of each line after (?.,!).
                          widget.post.body
                              .replaceAllMapped(
                                RegExp(r'(?<=[?.!])'),
                                (match) => '\n\n',
                              )
                              // Split the text into lines.
                              .split('\n')
                              // Trim spaces at the beginning of each line.
                              .map((line) => line.trimLeft())
                              // Join the lines back together.
                              .join('\n'),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
