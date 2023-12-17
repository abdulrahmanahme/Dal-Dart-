import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/app_strings.dart';
import 'package:flutter_assignment/config/app_text_styles.dart';
import '../core/widgets/post_item.dart';

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
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return PostItem(
                  title: "${AppStrings.postTittle}$index",
                  body: AppStrings.bodyPost,
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                 return PostItem(
                  title: "${AppStrings.postTittle}$index",
                  body: AppStrings.bodyPost,
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                 return PostItem(
                  title: "${AppStrings.postTittle}$index",
                  body: AppStrings.bodyPost,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
