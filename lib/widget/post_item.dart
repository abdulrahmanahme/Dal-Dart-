import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_assignment/config/app_colors.dart';
import '../config/app_text_styles.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Card(
        elevation: 4.0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: AppColors.white,
              border: const Border(
                top: BorderSide(
                  color: AppColors.yellow,
                  width: 5.0,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.font14black700),
                Row(
                  children: [
                    Expanded(
                      child: Text(body,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.font14black400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ).animate().fadeIn().scale(),
    );
  }
}
