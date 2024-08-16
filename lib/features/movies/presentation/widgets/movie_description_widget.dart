import 'package:flutter/material.dart';
import 'package:movies_test/core/extensions/string_extensions.dart';
import 'package:movies_test/core/themes/typography.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/themes/app_colors.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({
    super.key,
    this.desc,
  });

  final String? desc;

  @override
  Widget build(BuildContext context) {
    return desc.isNotEmptyOrNull()
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Story',
                  style: Header3(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 6),
                ReadMoreText(
                  desc! + desc! + desc!,
                  trimLines: 5,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: const Para2(
                    color: AppColors.neutralCaptionColor,
                  ),
                  moreStyle: const Para2(
                    color: AppColors.disableColor,
                  ).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  lessStyle: const Para2(
                    color: AppColors.disableColor,
                  ).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
