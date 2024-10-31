import 'dart:async';
import 'package:blog_app/blog_post.dart';
import 'package:intl/intl.dart';
class BlogPostViewModel {
  StreamController<List<BlogPost>> blogPostListController =
      StreamController.broadcast();

  Stream<List<BlogPost>> get outBlogPostList => blogPostListController.stream;

  Sink<List<BlogPost>> get _inBlogPostList => blogPostListController.sink;
  late List<BlogPost> _blogPosts;
  BlogPostViewModel() {
    outBlogPostList.listen((data) {
        _blogPosts = data;
    });

    Future.delayed(Duration(seconds: 3)).then((_) {
      // _inBlogPostList.add([
      //   new BlogPost(
      //       id: 1,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 1'),
      //   new BlogPost(
      //       id: 2,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 2'),
      //   new BlogPost(
      //       id: 3,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 3'),
      //   new BlogPost(
      //       id: 4,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 4'),
      //   new BlogPost(
      //       id: 5,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 5'),
      //   new BlogPost(
      //       id: 6,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 6'),
      //   new BlogPost(
      //       id: 7,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 7'),
      //   new BlogPost(
      //       id: 8,
      //       author: 'Author',
      //       content:
      //           'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
      //       publishDate: DateTime.now(),
      //       title: 'Blog Post 8')
      // ]);
      _inBlogPostList.add([
        BlogPost(
            id: 12,
            author: 'Sarah Williams',
            content: 'Exploring the beauty of nature through travel and photography.',
            publishDate: DateTime(2023, 5, 20),
            title: 'Nature Exploration'),
        BlogPost(
            id: 27,
            author: 'John Doe',
            content: 'Top 5 tips for starting your own business in a competitive market.',
            publishDate: DateTime(2024, 2, 15),
            title: 'Business Startup Guide'),
        BlogPost(
            id: 34,
            author: 'Aisha Rahman',
            content: 'A deep dive into the latest trends in artificial intelligence.',
            publishDate: DateTime(2024, 8, 1),
            title: 'AI Trends 2024'),
        BlogPost(
            id: 45,
            author: 'Carlos Mendoza',
            content: 'A quick guide to mastering the art of digital painting.',
            publishDate: DateTime(2024, 3, 10),
            title: 'Digital Art Guide'),
        BlogPost(
            id: 51,
            author: 'Emily Chen',
            content: 'How to stay fit and motivated through challenging workouts.',
            publishDate: DateTime(2023, 11, 28),
            title: 'Fitness Motivation'),
        BlogPost(
            id: 68,
            author: 'Liam Patel',
            content: 'Understanding the basics of blockchain and its applications.',
            publishDate: DateTime(2024, 7, 17),
            title: 'Blockchain Basics'),
        BlogPost(
            id: 73,
            author: 'Olivia Smith',
            content: 'Exploring culinary arts: top recipes from around the world.',
            publishDate: DateTime(2024, 4, 25),
            title: 'World Recipes'),
        BlogPost(
            id: 89,
            author: 'David Brown',
            content: 'The secrets to mastering public speaking and presentations.',
            publishDate: DateTime(2024, 1, 19),
            title: 'Public Speaking 101')
      ]);

    });
  }
  void addBlogPost(BlogPost blogPost){
    _blogPosts.add(blogPost);
    _inBlogPostList.add(_blogPosts);
  }
  void updateBlogPost(BlogPost blogPost){
    final index = _blogPosts.indexOf(
      _blogPosts.where((bp)=> bp.id == blogPost.id).first
    );
    _blogPosts[index] = blogPost;
    _inBlogPostList.add(_blogPosts);
  }

  void removeBlogPost(int id){
    _blogPosts.removeWhere((post)=> post.id == id);
    _inBlogPostList.add(_blogPosts);
  }
}
