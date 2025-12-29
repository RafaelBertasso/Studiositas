import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:studiositas/features/feed/domain/models/post_model.dart';

class StudyCard extends StatelessWidget {
  final PostModel post;
  const StudyCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              //NetworkImage(post.userPorfileUrl),
            ),
            title: Text(
              post.userName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              timeago.format(post.createdAt, locale: 'pt_BR'),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          ClipRRect(
            child: Image.network(
              post.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, size: 50),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.favorite, size: 22, color: Color(0xFF4A6B8A)),
                const SizedBox(width: 6),
                Text(
                  "${post.likesCount}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.chat_bubble,
                  size: 22,
                  color: Color(0xFF4A6B8A),
                ),
                const SizedBox(width: 6),
                Text(
                  "${post.commentsCount}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFD4AF37),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        post.duration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
