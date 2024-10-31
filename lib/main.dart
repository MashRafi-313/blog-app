import 'package:blog_app/blog_post_list.dart';
import 'package:blog_app/blog_post_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
void setupLocator(){
    GetIt.I.registerLazySingleton(() => BlogPostViewModel());
}

void main(){
  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage()
  ));
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlogPostList();
  }

}