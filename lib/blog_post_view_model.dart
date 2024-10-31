import 'dart:async';
import 'package:blog_app/blog_post.dart';
import 'package:intl/intl.dart';
class BlogPostViewModel {
  StreamController<List<BlogPost>> blogPostListController =
      StreamController.broadcast();

  Stream<List<BlogPost>> get outBlogPostList => blogPostListController.stream;

  Sink<List<BlogPost>> get _inBlogPostList => blogPostListController.sink;

  BlogPostViewModel() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      _inBlogPostList.add([
        new BlogPost(
            id: 1,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 1'),
        new BlogPost(
            id: 2,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 2'),
        new BlogPost(
            id: 3,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 3'),
        new BlogPost(
            id: 4,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 4'),
        new BlogPost(
            id: 5,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 5'),
        new BlogPost(
            id: 6,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 6'),
        new BlogPost(
            id: 7,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 7'),
        new BlogPost(
            id: 8,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 8')
      ]);
    });
  }
}
