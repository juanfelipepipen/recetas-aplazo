import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:pipen/extensions.dart';
import 'package:pipen/components.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';

class BlocFetchFailedBuilder<B extends StateStreamable<FetchState<S>>, S> extends StatelessWidget {
  const BlocFetchFailedBuilder({
    super.key,
    this.title,
    this.padding,
    this.onPressed,
    this.description,
    required this.child,
  });

  final String? title, description;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) => BlocBuilderFetch<B, S>(
    builder: (context, state, bloc) {
      // Build error view
      Widget builder() {
        if (state case FetchFail _) {
          VoidCallback? onPressed = this.onPressed;
          if (bloc case CubitFetch bloc) onPressed = bloc.fetch;
          return _FailerView(
            title: title,
            padding: padding,
            onPressed: onPressed,
            description: description,
          );
        }
        return child;
      }

      return builder();
    },
  );
}

class _FailerView extends StatelessWidget {
  const _FailerView({this.title, this.description, this.onPressed, this.padding});

  final String? title, description;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding ?? EdgeInsets.only(bottom: context.height * 0.15),
    child: Center(
      child: PipenColumn.center(
        spacing: PipenGap.verySmallSize,
        children: [
          Image.asset('assets/img/warning.png', width: context.width * 0.5),
          Text(
            title ?? context.localizations.componentBlocFetchFailedBuilderTitle,
            style: context.textTheme.titleMedium?.copyWith(letterSpacing: 0),
          ),
          PipenGap.small(),
          if (onPressed case VoidCallback onPressed)
            OutlinedButton.icon(
              onPressed: onPressed,
              icon: const Icon(size: 17, Icons.refresh),
              label: Text(
                context.localizations.componentBlocFetchFailedBuilderRetry,
                style: context.textTheme.titleSmall,
              ),
              style: OutlinedButton.styleFrom(
                overlayColor: Colors.black,
                foregroundColor: Colors.black,
              ),
            ),
        ],
      ),
    ),
  );
}
