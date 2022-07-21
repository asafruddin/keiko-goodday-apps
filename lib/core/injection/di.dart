import 'package:get_it/get_it.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/network/client.dart';
import 'package:keiko_good_day/data/datasource/auth_source.dart';
import 'package:keiko_good_day/data/repositories_impl/auth_repo_impl.dart';
import 'package:keiko_good_day/domain/repository/auth_repository.dart';
import 'package:keiko_good_day/domain/use_case/auth/login_usecase.dart';
import 'package:keiko_good_day/env/config.dart';
import 'package:keiko_good_day/presentation/bloc/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// initial component
  final config = await Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  /// register config environment
  sl
    ..registerLazySingleton(() => config)

    /// register shared preferences
    ..registerLazySingleton(() => prefs)

    /// register dio network client
    ..registerLazySingleton(() => sl<Client>().dio)
    ..registerLazySingleton(() => Client(config: sl(), prefs: sl()))

    /// register auth data source
    ..registerFactory<AuthSource>(() => AuthSourceImpl(sl()))

    /// register auth repository
    ..registerFactory<AuthRepository>(() => AuthRepoImpl(sl()))

    /// register login usecase
    ..registerFactory(() => LoginUseCase(sl()))

    /// register login bloc
    ..registerFactory(() => LoginBloc(sl()));
}
