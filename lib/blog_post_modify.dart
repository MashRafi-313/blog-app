import 'dart:math';

import 'package:blog_app/blog_post_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'blog_post.dart';

class BlogPostModify extends StatelessWidget {
  final BlogPost? blogPost;

  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  bool get isEditing => blogPost != null;

  BlogPostModify({this.blogPost = null}) {
    if (isEditing) {
      titleController.text = blogPost!.title;
      contentController.text = blogPost!.content;
      authorController.text = blogPost!.author;
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit blog post" : "Create blog post"),
        elevation: 0.0,
        actions: [
          isEditing
              ? IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _vm.removeBlogPost(this.blogPost!.id);
                    Navigator.of(context).pop();
                  },
                )
              : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(hintText: "Content"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(hintText: "Author"),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final blogPost = BlogPost(
                    id: isEditing
                        ? this.blogPost!.id
                        : Random().nextInt(100000),
                    title: titleController.text,
                    content: contentController.text,
                    author: authorController.text,
                    publishDate: DateTime.now(),
                  );
                  if (isEditing) {
                    _vm.updateBlogPost(blogPost);
                  } else {
                    _vm.addBlogPost(blogPost);
                  }
                },
                child: Text(
                  "Save",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
