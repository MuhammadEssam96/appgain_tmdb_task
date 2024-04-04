import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';

part 'remote_movie_details_source.g.dart';

@RestApi()
abstract class RemoteMovieDetailsSource {
  const factory RemoteMovieDetailsSource(Dio dio, {String baseUrl}) = _RemoteMovieDetailsSource;

  @GET('/movie/:id?append_to_response=credits')
  Future<HttpResponse<MovieDetails>> getMovieDetails({
    @Path()
    required int id,
  });
}
