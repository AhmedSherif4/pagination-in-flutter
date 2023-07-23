import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ready_pagination/pagination/data/data_source/remote_data_source.dart';
import 'package:ready_pagination/pagination/data/repo/repo.dart';
import 'package:ready_pagination/pagination/domain/base_repo/base_repo.dart';
import 'package:ready_pagination/pagination/domain/usecase/use_case.dart';
import 'package:ready_pagination/pagination/ui/bloc/pagination_bloc.dart';

import '../handle_error/network_info.dart';

final GetIt appServiceLocator = GetIt.instance;

class AppServiceLocator {
  static Future<void> initAppServiceLocator() async {
    appServiceLocator.registerFactory<PaginationBloc>(
        () => PaginationBloc(appServiceLocator()));

    appServiceLocator.registerLazySingleton<GetDataUseCase>(
        () => GetDataUseCase(baseRepo: appServiceLocator()));

    appServiceLocator.registerLazySingleton<BaseRepo>(() => Repo(
        networkInfo: appServiceLocator(), remoteData: appServiceLocator()));

    appServiceLocator.registerLazySingleton<RemoteData>(() => RemoteDataImpl());

    // Network information
    appServiceLocator.registerLazySingleton(() => InternetConnectionChecker());
    appServiceLocator.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(appServiceLocator()));
  }
}
