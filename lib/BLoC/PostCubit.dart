import 'package:blog_app_web/repositories/PostRepository.dart';
import 'package:blog_app_web/states/PostStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostsState> {
  PostCubit({required this.postsRepository}) : super(InitialState()) {
    getPostList();
  }

  final PostsRepositoryInterface postsRepository;

  Future<void> getPostList() async {
    try {
      emit(LoadingState());
      final posts = await postsRepository.getPostList();
      emit(LoadedState(posts));
    } catch (error) {
      emit(ErrorState(error));
    }
  }

  @override
  Future<void> close() {
    postsRepository.dispose();
    return super.close();
  }
}
