import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/shared/ui/animations/circular_progress_indicator.dart';
import 'package:pudge/shared/ui/animations/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.user, required this.size});

  final User user;
  final double size;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = user.avatar?.originalUrl;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[500],
      ),
      clipBehavior: Clip.hardEdge,
      child: avatarUrl != null
          ? CachedNetworkImage(
              imageUrl: avatarUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildShimmerAvatar(size),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            )
          : const Icon(Icons.person, size: 24, color: Colors.white70),
    );
  }

  Widget _buildShimmerAvatar(double size) {
    return CustomShimmer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
    );
  }
}
