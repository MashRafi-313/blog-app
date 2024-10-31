import 'package:blog_app/blog_post.dart';
import 'package:blog_app/blog_post_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'blog_post_modify.dart';

class BlogPostList extends StatelessWidget {
  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  const BlogPostList({super.key});

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog posts"),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme
            .of(context)
            .primaryColor,
        //elevation: 30,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
            BlogPostModify()
          ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: StreamBuilder<List<BlogPost>>(
            stream: _vm.outBlogPostList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final blogPosts = snapshot.data;
              return ListView.builder(
                itemCount: blogPosts!.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => BlogPostModify(blogPost:blogPost,)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blogPost.title,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              formatDate(blogPost.publishDate),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
