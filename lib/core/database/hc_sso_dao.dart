// import 'package:moor_flutter/moor_flutter.dart';

// import 'database_module.dart';
// import 'entities/notif_entities.dart';

// part 'hc_sso_dao.g.dart';

// @UseDao(tables: [NotifEntities])
// class HCSSODao extends DatabaseAccessor<DatabaseModule> with _$HrisDaoMixin {
//   HCSSODao(DatabaseModule db) : super(db);

//   // Future insertMovie(Movie movie) =>
//   //     into(movies).insert(movie, mode: InsertMode.insertOrReplace);
//   // Future updateMovie(Movie movie) => update(movies).replace(movie);

//   // Future updateMovielogin(MoviesloginData movie) =>
//   //     update(movieslogin).replace(movie);

//   // Future insertMovielogin(MoviesloginData movie) =>
//   //     into(movieslogin).insert(movie, mode: InsertMode.insertOrReplace);

//   // Future<List<MoviesloginData>> getloginMovie(int movie_id) {
//   //   return (select(movieslogin)
//   //         ..where((tbl) => tbl.movieId.equals(movie_id)))
//   //       .get();
//   // }

//   // Future deleteMovie(Movie movie) => delete(movies).delete(movie);
//   // Future deleteMovieByType(String type) {
//   //   return (delete(movies)..where((tbl) => tbl.typeMovie.equals(type))).go();
//   // }

//   // Future deleteAllMovie() => delete(movies).go();
//   // Future<List<Movie>> getAllMovie() => select(movies).get();
//   // Future<List<Movie>> getAllMovieByType(String type) {
//   //   return (select(movies)..where((tbl) => tbl.typeMovie.equals(type))).get();
//   // }

//   // Future<List<Movie>> getAllMovieByID(int movie_id, String type) {
//   //   return (select(movies)
//   //         ..where((tbl) => tbl.typeMovie.equals(type))
//   //         ..where((tbl) => tbl.movieId.equals(movie_id)))
//   //       .get();
//   // }

//   // Future<List<MoviesloginData>> getAllloginMovies(
//   //         int limit, int offset) =>
//   //     (select(movieslogin)
//   //           ..where((tbl) => tbl.login.equals(true))
//   //           ..limit(limit, offset: offset))
//   //         .get();
// }
