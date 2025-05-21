import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/album_repository.dart';
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';

abstract class AlbumEvent {}
class FetchAlbums extends AlbumEvent {}
class FetchAlbumDetails extends AlbumEvent {
  final int albumId;
  FetchAlbumDetails(this.albumId);
}

abstract class AlbumState {}
class AlbumInitial extends AlbumState {}
class AlbumLoading extends AlbumState {}
class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  AlbumLoaded(this.albums);
}
class AlbumDetailsLoaded extends AlbumState {
  final List<Photo> photos;
  AlbumDetailsLoaded(this.photos);
}
class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
}

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });

    on<FetchAlbumDetails>((event, emit) async {
      emit(AlbumLoading());
      try {
        final photos = await repository.fetchPhotosByAlbumId(event.albumId);
        emit(AlbumDetailsLoaded(photos));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}