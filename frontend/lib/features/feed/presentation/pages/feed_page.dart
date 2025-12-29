import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studiositas/features/feed/presentation/cubit/feed_cubit.dart';
import 'package:studiositas/features/feed/presentation/widgets/study_card.dart';
import 'package:studiositas/injection.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FeedCubit>()..fetchPosts(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text(
            'Studiositas',
            style: TextStyle(
              color: Color(0xFF4A6B8A),
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFF8F9FA),
          elevation: 0,
        ),
        body: BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) {
            if (state is FeedLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
              );
            }
            if (state is FeedError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<FeedCubit>().fetchPosts(),
                      child: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              );
            }
            if (state is FeedLoaded) {
              if (state.posts.isEmpty) {
                return const Center(
                  child: Text(
                    'Ainda não há estudos hoje. \n Seja o primeiro a postar!',
                  ),
                );
              }

              return RefreshIndicator(
                color: Color(0xFFD4AF37),
                onRefresh: () => context.read<FeedCubit>().fetchPosts(),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return StudyCard(post: state.posts[index]);
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF4A6B8A),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
