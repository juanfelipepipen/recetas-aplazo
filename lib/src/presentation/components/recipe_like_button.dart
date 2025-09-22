import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pipen/components.dart';

class RecipeLikeButton extends StatelessWidget {
  const RecipeLikeButton({
    super.key,
    this.filled,
    this.isLiked,
    this.recipeId,
    this.alignment,
    this.size = 30,
    required this.onTap,
  });

  final Future<bool?> Function(bool) onTap;
  final bool? isLiked, filled;
  final Alignment? alignment;
  final int? recipeId;
  final double size;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    loading: recipeId == null,
    alignment: alignment,
    child: LikeButton(
      size: size,
      onTap: onTap,
      isLiked: isLiked ?? false,
      circleColor: CircleColor(start: Colors.red.withValues(alpha: 0.7), end: Colors.red),
      bubblesColor: BubblesColor(
        dotSecondaryColor: Colors.red,
        dotPrimaryColor: Colors.red.withValues(alpha: 0.8),
      ),
      likeBuilder: (bool isLiked) => Icon(
        size: size,
        color: isLiked ? Colors.red : Colors.grey,
        (isLiked || recipeId == null)
            ? Icons.favorite
            : (filled == true ? Icons.favorite : Icons.favorite_border),
      ),
    ),
  );
}
