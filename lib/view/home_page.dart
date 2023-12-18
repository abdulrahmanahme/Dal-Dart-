import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/app_strings.dart';
import 'package:flutter_assignment/config/app_text_styles.dart';
import '../widget/hot_posts.dart';
import '../widget/new_post.dart';
import '../widget/rising_posts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.flutterDev,
            style: AppTextStyle.font14black700,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppTextStyle.font16black700,
            unselectedLabelStyle: AppTextStyle.font14blackOpacity400,
            tabs: const [
              Tab(
                text: AppStrings.hot,
              ),
              Tab(
                text: AppStrings.newText,
              ),
              Tab(
                text: AppStrings.rising,
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HotPosts(),
            NewPosts(),
            RisingPosts(),
          ],
        ),
      ),
    );
  }
}
