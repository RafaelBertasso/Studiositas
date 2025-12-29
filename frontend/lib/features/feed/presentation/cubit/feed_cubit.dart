import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studiositas/features/feed/data/post_service.dart';
import 'package:studiositas/features/feed/domain/models/post_model.dart';

abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<PostModel> posts;
  FeedLoaded(this.posts);
}

class FeedError extends FeedState {
  final String message;
  FeedError(this.message);
}

class FeedCubit extends Cubit<FeedState> {
  final PostService _postService;
  FeedCubit(this._postService) : super(FeedInitial());

  Future<void> fetchPosts() async {
    emit(FeedLoading());
    try {
      final data = await _postService.fetchPosts();
      final posts = data.map((json) => PostModel.fromJson(json)).toList();
      emit(FeedLoaded(posts));
    } catch (e) {
      emit(FeedError("Erro ao carregar feed: $e"));
    }
  }
}
