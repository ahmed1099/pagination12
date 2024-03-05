import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/cubit/posts_cubit.dart';
import 'package:pagination/posts_screen/model/post_repo.dart';
import 'package:pagination/posts_screen/posts_screen.dart';
import 'package:pagination/services/posts_service.dart';

void main() {
  runApp(
    PaginationApp(
      repository: PostsRepo(
        PostsService(),
      ),
    ),
  );
}

class PaginationApp extends StatelessWidget {
  final PostsRepo repository;

  const PaginationApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      home: BlocProvider(
        create: (
          context,
        ) =>
            PostsCubit(
          repository,
        ),
        child: PostsView(),
      ),
    );
  }
}
