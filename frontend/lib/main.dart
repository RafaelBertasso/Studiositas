import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:studiositas/core/theme/app_theme.dart';
import 'package:studiositas/features/auth/data/auth_repository.dart';
import 'package:studiositas/features/auth/presentation/pages/login_page.dart';
import 'package:studiositas/features/feed/presentation/pages/feed_page.dart';
import 'package:studiositas/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();

  final authRepo = getIt<AuthRepository>();
  final int? userId = await authRepo.getUserId();

  await initializeDateFormatting('pt_BR', null);
  runApp(Studiositas(isLoggedIn: userId != null));
}

class Studiositas extends StatelessWidget {
  final bool isLoggedIn;
  const Studiositas({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studiositas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        '/feed': (context) => const FeedPage(),
        '/login': (context) => const LoginPage(),
      },
      home: const LoginPage(),
    );
  }
}
