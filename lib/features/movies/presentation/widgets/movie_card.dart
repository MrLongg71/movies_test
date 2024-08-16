import 'package:flutter/material.dart';
import 'package:movies_test/core/extensions/string_extensions.dart';
import 'package:movies_test/core/themes/typography.dart';
import 'package:movies_test/core/widgets/image_network_app.dart';
import 'package:movies_test/features/movies/domain/entities/movie_entity.dart';

import '../../../../core/themes/app_colors.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieEntity,
    required this.onTap,
  });

  final MovieEntity movieEntity;
  final Function(int? id) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(movieEntity.id),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageNetworkApp(
                    url: movieEntity.getPosterUrl(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        movieEntity.title ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const Header3(color: AppColors.whiteColor),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (movieEntity
                            .getYearMovieReleaseDate()
                            .isNotEmptyOrNull()) ...[
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              movieEntity.getYearMovieReleaseDate(),
                              textAlign: TextAlign.center,
                              style: const Sub2(color: AppColors.whiteColor),
                            ),
                          ),
                        ],
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.ratingIconColor,
                          size: 18,
                        ),
                        Text(
                          movieEntity.getVoteAverage(),
                          style: const Sub2(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        movieEntity.overview ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const Para1(color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
