import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/sub_base.dart';
import '../widgets/card_post.dart';
import '../utils/requests.dart';
import '../models/post_schema.dart';
import '../widgets/modal.dart';

class Community extends StatefulWidget {
  const Community({super.key});
  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  // Add a GlobalKey to access the form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller for the text fields in the modal
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  // Function to show the add post modal
  Future<void> _showAddPostModal(BuildContext context) async {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create Post",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(Icons.border_style),
                            SizedBox(width: 10),
                            Text("Post Title"),
                          ],
                        ),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: "Title",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(Icons.border_style),
                            SizedBox(width: 10),
                            Text("Post Body"),
                          ],
                        ),
                        TextFormField(
                          controller: _bodyController,
                          decoration: const InputDecoration(
                            hintText: "Body",
                          ),
                          maxLines: null,
                          autocorrect: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a body';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                // Validate (ensure that the form is filled out)
                                if (_titleController.text.isEmpty ||
                                    _bodyController.text.isEmpty) {
                                  showModal(
                                      context,
                                      "Missing Values",
                                      "Please fill out all the fields in the form.",
                                      const Icon(Icons.question_mark_outlined));
                                  return;
                                }

                                // Add Post
                                await addPost(
                                  post: Post(
                                    title: _titleController.text,
                                    body: _bodyController.text,
                                    image: "https://picsum.photos/200",
                                    author: "User",
                                    date:
                                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                  ),
                                );
                                // Refresh the page
                                setState(() {
                                  _titleController.clear();
                                  _bodyController.clear();
                                });

                                // ignore: use_build_context_synchronously
                                showModal(
                                    context,
                                    "Post Added",
                                    "Your post has been added to the community space.",
                                    const Icon(Icons.check_circle_outline));

                                // Delay the pop
                                if (mounted && Navigator.canPop(context)) {
                                  await Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      Navigator.pop(context);
                                    },
                                  );
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              minWidth: double.maxFinite,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.only(bottom: 80),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // Display the list of posts
                      ...snapshot.data ?? const <Widget>[],
                    ],
                  ),
                ),
                // Add a floating action button
                Positioned(
                  bottom: 80.0,
                  right: 16.0,
                  child: FloatingActionButton(
                    onPressed: () => _showAddPostModal(context),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
