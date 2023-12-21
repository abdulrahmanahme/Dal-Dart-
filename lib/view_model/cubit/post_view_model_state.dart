part of 'post_view_model_cubit.dart';

@immutable
class PostViewModelState {}

class PostViewModelInitial extends PostViewModelState {}
/////Hot Post States

class PostHotLoadingState extends PostViewModelState {}

class PostHotSuccessState extends PostViewModelState {}

class PostHotErrorState extends PostViewModelState {}

/////// New Posts Stated
class PostNewLoadingState extends PostViewModelState {}

class PostNewSuccessState extends PostViewModelState {}

class PostNewErrorState extends PostViewModelState {}

/////// Rising Posts Stated
class PostRisingLoadingState extends PostViewModelState {}

class PostRisingSuccessState extends PostViewModelState {}

class PostRisingErrorState extends PostViewModelState {}
///////
class IsLoadingMoreDataRunningState extends PostViewModelState {}

