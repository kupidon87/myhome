import '../import.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable{
  PostState([Iterable props]) : super(props);
}

class PostUninitialized extends PostState{
  @override
  String toString() => 'PostUninitialized';
}

class PostInitialized extends PostState{
  final List<Post> posts;
  final bool hasError;
  final bool hasReachedMax;

  PostInitialized({
    this.posts,
    this.hasError,
    this.hasReachedMax,
}) : super([posts, hasError, hasReachedMax]);

  factory PostInitialized.success(List<Post> posts){
    return PostInitialized(
      posts: posts,
      hasError: false,
      hasReachedMax: false,
    );
  }

  factory PostInitialized.failure(){
    return PostInitialized(
      posts: [],
      hasError: true,
      hasReachedMax: true,
    );
  }

  PostInitialized copeWith({
  List<Post> posts,
    bool hasError,
    bool hasReachedMax,
}) {
    return PostInitialized(
      posts: posts ?? this.posts,
      hasError: hasError ?? this.hasError,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() => 'PostInitialized {'
      'posts: ${posts.length}, '
      'hasError: $hasError, '
      'hasReachedMax: $hasReachedMax '
      '}';
}