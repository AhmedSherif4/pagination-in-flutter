import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_pagination/core/services/services_locator.dart';

import '../../data/model/post.dart';
import '../bloc/pagination_bloc.dart';
import '../widgets/error_dialog.dart';
import '../widgets/post_item.dart';

class PostsOverviewScreen extends StatelessWidget {
  const PostsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          appServiceLocator<PaginationBloc>()..add(const LoadPageEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog App"),
          centerTitle: true,
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, state) {
            if (context.read<PaginationBloc>().posts.isEmpty) {
              if (state == PaginationLoadingState()) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              } else if (state == PaginationErrorState()) {
                return Center(
                    child: errorDialog(
                        size: 20,
                        onPressed: () {
                          context
                              .read<PaginationBloc>()
                              .add(const LoadPageEvent());
                        }));
              }
            }
            return ListView.builder(
                itemCount: context.read<PaginationBloc>().posts.length +
                    (context.read<PaginationBloc>().isLastPage ? 0 : 1),
                itemBuilder: (context, index) {
                  // request more data when the user has reached the trigger point.
                  context
                      .read<PaginationBloc>()
                      .add(CheckIfNeedMoreDataEvent(index: index));
                  // when the user gets to the last item in the list, check whether
                  // there is an error, otherwise, render a progress indicator.
                  if (index == context.read<PaginationBloc>().posts.length) {
                    if (state == PaginationErrorState()) {
                      return Center(
                          child: errorDialog(
                              size: 15,
                              onPressed: () {
                                context
                                    .read<PaginationBloc>()
                                    .add(const LoadPageEvent());
                              }));
                    } else {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ));
                    }
                  }

                  final Post post = context.read<PaginationBloc>().posts[index];
                  return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PostItem(index.toString(), post.body));
                });
          },
        ),
      ),
    );
  }
}
