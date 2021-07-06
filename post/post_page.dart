//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart' as http;
//import '../import.dart';
//import 'package:flutter/material.dart';
//
//class PostPage extends StatefulWidget {
//  @override
//  _PostPageState createState() => _PostPageState();
//}
//
//class _PostPageState extends State<PostPage> {
//  final _scrollController = ScrollController();
//  final PostBloc _postBloc = PostBloc(httpClient: http.Client());
//  final _scrollThreshold = 200.0;
//
//  _PostPageState() {
//    _scrollController.addListener(_onScroll);
//    _postBloc.dispatch(Fetch());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder(
//      bloc: _postBloc,
//      builder: (BuildContext context, PostState state) {
//        if (state.isInitializing) {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//        if (state.isError) {
//          return Center(
//            child: Text('failed to fetch posts'),
//          );
//        }
//        if (state.posts.isEmpty) {
//          return Center(
//            child: Text('no posts'),
//          );
//        }
//        return ListView.builder(
//          itemBuilder: (BuildContext context, int index) {
//            return index >= state.posts.length
//                ? BottomLoader()
//                : PostWidget(post: state.posts[index]);
//          },
//          itemCount:
//          state.hasReachedMax ? state.posts.length : state.posts.length + 1,
//          controller: _scrollController,
//        );
//      },
//    );
//  }
//
//  @override
//  void dispose() {
//    _postBloc.dispose();
//    super.dispose();
//  }
//
//  void _onScroll() {
//    final maxScroll = _scrollController.position.maxScrollExtent;
//    final currentScroll = _scrollController.position.pixels;
//    if (maxScroll - currentScroll <= _scrollThreshold) {
//      _postBloc.dispatch(Fetch());
//    }
//  }
//}