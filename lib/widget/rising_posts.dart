import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_item.dart';
import '../model/Api/post_api.dart';
import '../model/repository/post_repository.dart';
import '../view_model/cubit/post_view_model_cubit.dart';

class RisingPosts extends StatelessWidget {
  const RisingPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostViewModel(postRepository: PostRepository(postsApi: PostsApi()))
            ..loadRising()
            ..scrollcontrollerListRisingPosts(),
      child: BlocConsumer<PostViewModel, PostViewModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<PostViewModel>();
          return state is PostNewLoadingState
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: cubit.scrollcontroller,
                  shrinkWrap: true,
                  itemCount: cubit.isLoadingMoreDataRunning
                      ? cubit.risingPosts.length + 1
                      : cubit.risingPosts.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < cubit.risingPosts.length) {
                      return PostItem(
                        title: cubit.risingPosts[index].data.title,
                        body: cubit.risingPosts[index].data.selftext,
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
        },
      ),
    );
  }
}
