import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:studiositas/core/theme/app_theme.dart';
import 'package:studiositas/features/feed/presentation/pages/feed_page.dart';
import 'package:studiositas/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();

  await initializeDateFormatting('pt_BR', null);
  runApp(const Studiositas());
}

class Studiositas extends StatelessWidget {
  const Studiositas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studiositas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: FeedPage(),
    );
  }
}

// Apenas para o app rodar agora
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text("Studiositas Acadêmica")));
}
