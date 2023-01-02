import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/views/error_view.dart';
import 'package:portfolio/src/views/home_view.dart';

final router = GoRouter(
    errorBuilder: (context, state) {
      if (state.error.toString().contains("no routes")) {
        return ErrorView(location: state.location);
      }
      debugPrint(state.error.toString());
      return const ErrorView(location: '/${ErrorView.routePath}');
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'root',
        path: '/',
        builder: (_, __) => const HomeView(),
      ),
    ]);