import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/core/end_points/end_points.dart';
import 'package:meta/meta.dart';
import '../../model/model/psot_model.dart';
import '../../model/repository/post_repository.dart';
part 'post_view_model_state.dart';

class PostViewModel extends Cubit<PostViewModelState> {
  PostViewModel({required this.postRepository}) : super(PostViewModelInitial());
  final PostRepository postRepository;
  int pages = 5;
  PostModel? postModel;
  List<ChildPost> hotPosts = [];
  List<ChildPost> newPosts = [];
  List<ChildPost> risingPosts = [];

  void loadHot() {
    emit(PostHotLoadingState());
    postRepository
        .fetchPosts(page: pages, endpoint: Endpoint.hot)
        .then((value) {
      hotPosts.addAll(value.data.children);
      emit(PostHotSuccessState());
    }).catchError((e) {
      emit(PostHotErrorState());
    });
  }

  void loadNew() {
    emit(PostNewLoadingState());
    postRepository
        .fetchPosts(page: pages, endpoint: Endpoint.newPoint)
        .then((value) {
      newPosts.addAll(value.data.children);

      emit(PostNewSuccessState());
    }).catchError((e) {
      emit(PostNewErrorState());
    });
  }

  void loadRising() {
    emit(PostRisingLoadingState());
    postRepository
        .fetchPosts(page: pages, endpoint: Endpoint.rising)
        .then((value) {
      risingPosts.addAll(value.data.children);
      emit(PostRisingSuccessState());
    }).catchError((e) {
      emit(PostRisingErrorState());
    });
  }

  /////
  var scrollcontroller = ScrollController();
  int page = 5;
  bool isLoadingMoreDataRunning = false;
  void scrollcontrollerListNewPosts() {
    scrollcontroller.addListener(loadMoreDataNew);
  }


  void scrollcontrollerListHotPosts() {
    scrollcontroller.addListener(loadMoreHotPosts);
  }


  void scrollcontrollerListRisingPosts() {
    scrollcontroller.addListener(loadMoreDataRisingPosts);
  }


  Future<void> loadMoreDataRisingPosts() async {
    if (isLoadingMoreDataRunning) return;
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      emit(IsLoadingMoreDataRunningState());
      isLoadingMoreDataRunning = true;
      page += 5;
      await postRepository
          .fetchPosts(page: page, endpoint: Endpoint.rising)
          .then((value) {
        risingPosts = value.data.children;
      });
      isLoadingMoreDataRunning = false;
      emit(IsLoadingMoreDataRunningState());
    }
  }

  Future<void> loadMoreDataNew() async {
    if (isLoadingMoreDataRunning) return;
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      emit(IsLoadingMoreDataRunningState());
      isLoadingMoreDataRunning = true;
      page += 5;
      await postRepository
          .fetchPosts(page: page, endpoint: Endpoint.newPoint)
          .then((value) {
        newPosts = value.data.children;
      });
      isLoadingMoreDataRunning = false;
      emit(IsLoadingMoreDataRunningState());
    }
  }

  Future<void> loadMoreHotPosts() async {
    if (isLoadingMoreDataRunning) return;
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      emit(IsLoadingMoreDataRunningState());
      isLoadingMoreDataRunning = true;
      page += 5;
      await postRepository
          .fetchPosts(page: page, endpoint: Endpoint.hot)
          .then((value) {
        hotPosts = value.data.children;
      });
      isLoadingMoreDataRunning = false;
      emit(IsLoadingMoreDataRunningState());
    }
  }
}
