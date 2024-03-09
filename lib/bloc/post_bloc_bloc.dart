import 'package:apis_with_bloc/bloc/post_bloc_event.dart';
import 'package:apis_with_bloc/bloc/post_bloc_state.dart';
import 'package:apis_with_bloc/repository/post-repo.dart';
import 'package:apis_with_bloc/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostBlocEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }
  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, message: "success", postList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
