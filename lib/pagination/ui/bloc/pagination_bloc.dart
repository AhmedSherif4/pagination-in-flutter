import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_pagination/core/handle_error/failure.dart';
import 'package:ready_pagination/pagination/domain/usecase/use_case.dart';

import '../../data/model/post.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final GetDataUseCase getDataUseCase;

  bool isLastPage = false;
  int pageNumber = 0;
  final int numberOfPostsPerRequest = 5;
  List<Post> posts = [];
  final int nextPageTrigger = 3;

  PaginationBloc(this.getDataUseCase) : super(PaginationInitialState()) {
    on<LoadPageEvent>((event, emit) async {
      emit(PaginationLoadingState());
      try {
        final Either<Failure, List<Post>> result = await getDataUseCase(
          numberOfPostsPerRequest: numberOfPostsPerRequest,
          pageNumber: pageNumber,
        );
        result.fold((l) {
          print("error --> $l");
          emit(PaginationErrorState());
        }, (postList) {
          isLastPage = postList.length < numberOfPostsPerRequest;
          pageNumber = pageNumber + 1;
          posts.addAll(postList);
          print('DDDDDDDDDDDDDD');
          emit(PaginationLoadedState());
        });
      } catch (e) {
        print("error --> $e");
        emit(PaginationErrorState());
      }
    });
    on<CheckIfNeedMoreDataEvent>((event, emit) async {
      emit(PaginationLoadingState());
      if (event.index == posts.length - nextPageTrigger) {
        add(const LoadPageEvent());
      }
    });
  }
}
