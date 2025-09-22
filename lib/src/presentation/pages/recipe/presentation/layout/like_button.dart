part of '../recipe_page.dart';

class _LikeButton extends StatelessWidget {
  const _LikeButton({this.recipeId, this.isLiked});

  final bool? isLiked;
  final int? recipeId;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    child: LikeButton(
      size: 30,
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
