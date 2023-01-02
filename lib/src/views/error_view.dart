import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/providers.dart';
import 'package:portfolio/src/widgets/custom_error_widget.dart';

class ErrorView extends ConsumerWidget {
  /// Named route for [ErrorView].
  static const String routeName = 'error';

  /// Path route for [ErrorView].
  static const String routePath = 'error';
  
  /// Path route for [ErrorView] with not found error.
  static const String notFoundPath = 'not-found';

  final String location;

  const ErrorView({required this.location, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Scaffold(
      body: CustomErrorWidget(
        text: (location == '/$routePath')
            ? appLocalizations.genericError
            : appLocalizations.pageNotFound,
      ),
    );
  }

}
