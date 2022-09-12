import 'package:get_it/get_it.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/network/client.dart';
import 'package:keiko_good_day/data/datasource/actor_datasource.dart';
import 'package:keiko_good_day/data/datasource/auth_source.dart';
import 'package:keiko_good_day/data/datasource/master_datasource.dart';
import 'package:keiko_good_day/data/repositories_impl/actor_repo_impl.dart';
import 'package:keiko_good_day/data/repositories_impl/auth_repo_impl.dart';
import 'package:keiko_good_day/data/repositories_impl/master_repo_impl.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';
import 'package:keiko_good_day/domain/repository/auth_repository.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';
import 'package:keiko_good_day/domain/use_case/actor/confirm_redeem_gift_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/confirm_visit_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/get_redeem_gift_history_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/purchase_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/redeem_gift_usecase.dart';
import 'package:keiko_good_day/domain/use_case/auth/login_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_cluster_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_cofirmation_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_gift_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_product_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_rayons_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_shop_detail_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_shops_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_statistic_usecase.dart';
import 'package:keiko_good_day/env/config.dart';
import 'package:keiko_good_day/presentation/bloc/confirmation_picture/confirmation_picture_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/login/login_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/product/product_bloc.dart';

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

    /// register master data source
    ..registerFactory<MasterDatasource>(() => MasterDataSourceImpl(sl()))

    /// register actor data sources
    ..registerFactory<ActorDatasource>(() => ActorDataSourceImpl(sl()))

    /// register auth repository
    ..registerFactory<AuthRepository>(() => AuthRepoImpl(sl()))

    /// register master repository
    ..registerFactory<MasterRepository>(() => MasterRepoImpl(sl()))

    /// register actor repository
    ..registerFactory<ActorRepository>(() => ActorRepoImpl(sl()))

    /// register login usecase
    ..registerFactory(() => LoginUseCase(sl()))

    /// register statistic usecase
    ..registerFactory(() => GetStatisticUseCase(sl()))

    /// register cluster usecase
    ..registerFactory(() => GetClusterUseCase(sl()))

    /// register rayons usecase
    ..registerFactory(() => GetRayonsUseCase(sl()))

    /// register shops usecase
    ..registerFactory(() => GetShopsUseCase(sl()))

    // register gift usecase
    ..registerFactory(() => GetGiftUseCase(sl()))

    // register products usecase
    ..registerFactory(() => GetProducUseCase(sl()))

    // register confirmation usecase
    ..registerFactory(() => GetConfirmationUseCase(sl()))

    // register shop detail usecase
    ..registerFactory(() => GetShopDetailUseCase(sl()))

    /// register purchase usecase
    ..registerFactory(() => PurchaseUseCase(sl()))

    /// register redeem gift usecase
    ..registerFactory(() => RedeemGiftUseCase(sl()))

    /// register get redeem gift history usecase
    ..registerFactory(() => GetRedeemGiftHistoryUseCase(sl()))

    // register confirmation redeem gift
    ..registerFactory(() => ConfirmRedeemGiftUseCase(sl()))

    /// register confirmation visit picture
    ..registerFactory(() => ConfirmVisitUseCase(sl()))

    /// register login bloc
    ..registerFactory(() => LoginBloc(sl()))

    /// register master bloc
    ..registerFactory(() =>
        MasterDataLoaderBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()))

    /// register product bloc
    ..registerFactory(() => ProductBloc(sl(), sl(), sl()))

    /// register confirmation picture bloc
    ..registerFactory(() => ConfirmationPictureBloc(sl(), sl()));
}
