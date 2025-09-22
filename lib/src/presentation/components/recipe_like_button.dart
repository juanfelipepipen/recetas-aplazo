import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pipen/components.dart';

class RecipeLikeButton extends StatelessWidget {
  const RecipeLikeButton({super.key, this.recipeId, this.isLiked, required this.onTap});

  final Future<bool?> Function(bool) onTap;
  final bool? isLiked;
  final int? recipeId;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    loading: recipeId == null,
    child: LikeButton(
      size: 30,
      onTap: onTap,
      isLiked: isLiked,
      circleColor: CircleColor(start: Colors.red.withValues(alpha: 0.7), end: Colors.red),
      bubblesColor: BubblesColor(
        dotSecondaryColor: Colors.red,
        dotPrimaryColor: Colors.red.withValues(alpha: 0.8),
      ),
      likeBuilder: (bool isLiked) => Icon(
        size: 30,
        color: isLiked ? Colors.red : Colors.grey,
        (isLiked || recipeId == null) ? Icons.favorite : Icons.favorite_border,
      ),
    ),
  );
}
