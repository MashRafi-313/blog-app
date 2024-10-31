import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blog_post.dart';

class BlogPostModify extends StatelessWidget {
  final BlogPost? blogPost;

  bool get isEditing => blogPost != null;

  BlogPostModify({this.blogPost = null}){
    if(isEditing){
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
          isEditing ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete)) : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: "Title"
              ),
            ),
            const SizedBox(height: 5,), TextField(
              controller: contentController,
              decoration: const InputDecoration(
                  hintText: "Content"
              ),
            ),
            const SizedBox(height: 5,), TextField(
              controller: authorController,
              decoration: const InputDecoration(
                  hintText: "Author"
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                final blogPost = BlogPost(
                  id: isEditing ? this.blogPost!.id : Random().nextInt(100000),
                  title: titleController.text,
                  content: contentController.text,
                  author: authorController.text,
                  publishDate: DateTime.now(),
                );
              }, child: Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
