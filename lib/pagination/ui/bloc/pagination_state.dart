part of 'pagination_bloc.dart';

abstract class PaginationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationInitialState extends PaginationState {
   PaginationInitialState();
}

class PaginationLoadedState extends PaginationState {}

class PaginationLoadingState extends PaginationState {}

class PaginationErrorState extends PaginationState {}