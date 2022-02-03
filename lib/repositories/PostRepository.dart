import 'dart:async';
import 'package:blog_app_web/post/PostModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Abstrata
abstract class PostsRepositoryInterface {
  Future<List<Post>> getPostList();

  void dispose();
}

// Classe de implementação
class PostRepository implements PostsRepositoryInterface {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection("Post");

  dispose() {}

  @override
  Future<List<Post>> getPostList() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await collectionReference.get();
      List<Post> posts = [];
      querySnapshot.docs.forEach((element) {
        posts.add(Post.fromJson(element.data()));
      });
      return posts;
    } catch (error) {
      throw error;
    }
  }
}
