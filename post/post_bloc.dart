//import 'dart:convert';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import '../import.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//class PostBloc extends Bloc<PostEvent, PostState> {
//  final http.Client httpClient;
//
//  PostBloc({@required this.httpClient});
//
//  @override
//  Stream<PostEvent> transform(Stream<PostEvent> events) {
//    return (events as Observable<PostEvent>)
//        .debounce(Duration(milliseconds: 500));
//  }
//
//  @override
//  get initialState => PostState.initial();
//
//  @override
//  Stream<PostState> mapEventToState(currentState, event) async* {
//    if (event is Fetch && !currentState.hasReachedMax) {
//      try {
//        final posts = await _fetchPosts(currentState.posts.length, 20);
//        if (posts.isEmpty) {
//          yield currentState.copyWith(hasReachedMax: true);
//        } else {
//          yield PostState.success(currentState.posts + posts);
//        }
//      } catch (_) {
//        yield PostState.failure();
//      }
//    }
//  }
//
//  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
//    final response = await httpClient.get(
//        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
//    if (response.statusCode == 200) {
//      final data = json.decode(response.body) as List;
//      return data.map((rawPost) {
//        return Post(
//          id: rawPost['id'],
//          title: rawPost['title'],
//          body: rawPost['body'],
//        );
//      }).toList();
//    } else {
//      throw Exception('error fetching posts');
//    }
//  }
//}