import 'package:flutter/material.dart';
import 'package:movies_test/core/extensions/string_extensions.dart';
import 'package:movies_test/core/navigation/routes.dart';
import 'package:movies_test/core/widgets/image_network_app.dart';
import 'package:movies_test/features/movies/domain/entities/movie_detail_entity.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/typography.dart';
import '../../../../core/widgets/circle_dot.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movieDetailEntity});

  final MovieDetailEntity movieDetailEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blackColor,
                  AppColors.blackColor,
                  AppColors.transparent,
                ],
                stops: [0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: ImageNetworkApp(
                url: movieDetailEntity.getBackdropUrl(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieDetailEntity.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const Header3(color: AppColors.whiteColor),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (movieDetailEntity
                        .getYearMovieReleaseDate()
                        .isNotEmptyOrNull()) ...[
                      Text(
                        movieDetailEntity.getYearMovieReleaseDate(),
                        textAlign: TextAlign.center,
                        style:
                            const Para1(color: AppColors.neutralCaptionColor),
                      ),
                      const CircleDot(),
                    ],
                    if (movieDetailEntity.genres.isNotEmptyOrNull()) ...[
                      Text(
                        movieDetailEntity.genres.firstOrNull?.name ?? '',
                        textAlign: TextAlign.center,
                        style:
                            const Para1(color: AppColors.neutralCaptionColor),
                      ),
                      const CircleDot(),
                    ],
                    if (movieDetailEntity.getRuntime().isNotEmptyOrNull()) ...[
                      Text(
                        movieDetailEntity.getRuntime() ?? '',
                        textAlign: TextAlign.center,
                        style:
                            const Para1(color: AppColors.neutralCaptionColor),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.ratingIconColor,
                      size: 18,
                    ),
                    Text(
                      movieDetailEntity.getVoteAverage(),
                      style: const Sub2(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    if (movieDetailEntity.voteCount != null)
                      Text(
                        movieDetailEntity.getVotesCount() ?? '',
                        style: const Para2(
                          color: AppColors.neutralCaptionColor,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 16,
            child: InkWell(
              onTap: () {
                Routes.instance.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.iconContainerColor),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
