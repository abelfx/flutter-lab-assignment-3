import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';

class AlbumRepository {
  Future<List<Album>> fetchAlbums() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch albums');
    }
  }

  Future<List<Photo>> fetchPhotosByAlbumId(int albumId) async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Photo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }
}