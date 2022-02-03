import 'package:blog_app_web/post/PostModel.dart';
import 'package:equatable/equatable.dart';

// Abstrata
abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends PostsState {}

class LoadingState extends PostsState {}

class LoadedState extends PostsState {
  LoadedState(this.posts);

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}

class ErrorState extends PostsState {
  ErrorState(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
