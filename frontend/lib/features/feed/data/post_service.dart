import 'package:dio/dio.dart';

class PostService {
  final Dio _dio;

  PostService(this._dio);

  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await _dio.get('/post');
      if (response.statusCode == 200) {
        return response.data as List;
      }
      return [];
    } catch (e) {
      print('Erro ao buscar posts: $e');
      return [];
    }
  }

  Future<bool> createPost(Map<String, dynamic> postData) async {
    try {
      final response = await _dio.post('/post', data: postData);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Erro ao criar post: $e');
      return false;
    }
  }
}
