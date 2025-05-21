import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/album_bloc.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Albums")),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) return Center(child: CircularProgressIndicator());
          if (state is AlbumError) return Center(child: Text(state.message));
          if (state is AlbumLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0), // Outer padding
              child: ListView.builder(
                itemCount: state.albums.length,
                itemBuilder: (context, index) {
                  final album = state.albums[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4), // Space between items
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? Colors.grey.shade100
                          : Colors.blueGrey.shade50, // Alternating colors
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12), // Inner padding
                      title: Text(album.title),
                      onTap: () => context.go('/album/${album.id}'),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}