import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_assignment/config/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/app_text_styles.dart';
import '../core/end_points/end_points.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.title, required this.body,required this.endPoint,required  this.limit});
  final String title;
  final String body;
  final String endPoint;
  final int limit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl('${Endpoint.urlEndPinot}/$endPoint?limit=$limit');
      },
      child: Padding(
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
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ');
    }
  }
}
