import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_item.dart';
import '../model/Api/post_api.dart';
import '../model/repository/post_repository.dart';
import '../view_model/cubit/post_view_model_cubit.dart';

class HotPosts extends StatelessWidget {
 const HotPosts({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostViewModel(postRepository: PostRepository(postsApi: PostsApi()))
            ..loadHot()..scrollcontrollerListHotPosts(),
      child: BlocConsumer<PostViewModel, PostViewModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<PostViewModel>();
          return state is PostHotLoadingState
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: cubit.scrollcontroller,
                  shrinkWrap: true,
                  itemCount: cubit.isLoadingMoreDataRunning
                      ? cubit.hotPosts.length + 1
                      : cubit.hotPosts.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < cubit.hotPosts.length) {
                      return PostItem(
                        title:cubit.hotPosts[index].data.title ,
                        body:
                            cubit.hotPosts[index].data.selftext,
                      );
                    } else {
                      return const Padding(
                        padding:  EdgeInsets.all(20),
                        child:  Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
        },
      ),
    );
  }
}
