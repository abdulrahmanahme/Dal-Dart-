
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'post_item.dart';
import '../model/Api/post_api.dart';
import '../model/repository/post_repository.dart';
import '../view_model/cubit/post_view_model_cubit.dart';
class NewPosts extends StatelessWidget {
  const NewPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostViewModel(postRepository: PostRepository(postsApi: PostsApi(Client())))
            ..loadNew()..scrollcontrollerListNewPosts(),
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
                      ? cubit.newPosts.length + 1
                      : cubit.newPosts.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < cubit.newPosts.length) {
                      return PostItem(
                        title:cubit.newPosts[index].data.title ,
                        body:
                            cubit.newPosts[index].data.selftext,
                      );
                    } else {
                      return  const Padding(
                        padding: EdgeInsets.all(20),
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