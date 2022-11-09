import 'package:get_it/get_it.dart';
import 'package:restaurent_app/authentication/data/Repository/user_repository_impl.dart';
import 'package:restaurent_app/authentication/data/dataSource/user_dataSource.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/login_usercase.dart';
import 'package:restaurent_app/authentication/presentation/bloc/user_bloc_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // Features - post

    // Bloc

    sl.registerFactory(() => UserBlocBloc(
          CreaseUserUseCase: sl(),
          LoginUserCase: sl(),
        ));

    // Usecases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => CreateUserUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    // Datasources
    print("here 30");

    sl.registerLazySingleton<BaseUserRemoteDateSource>(
        () => UserRemoteDataSource());
    print("here 34");

    // core
    // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  }
}