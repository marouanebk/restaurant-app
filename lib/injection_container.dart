import 'package:get_it/get_it.dart';
import 'package:restaurent_app/authentication/data/Repository/user_repository_impl.dart';
import 'package:restaurent_app/authentication/data/dataSource/user_dataSource.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/authentication_state_usecase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/get_user_details_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/login_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/logout_usecase.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/mainpage/data/DataSource/food_remote_datasource.dart';
import 'package:restaurent_app/mainpage/data/Repository/foods_repository.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/food_repository.dart';
import 'package:restaurent_app/mainpage/domaine/UseCases/get_new_arrivals_usecase.dart';
import 'package:restaurent_app/mainpage/presentation/controller/Food/food_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // Bloc
    sl.registerFactory(() => UserBloc(sl(), sl(), sl(), sl() , sl()));
    sl.registerFactory(() => FoodBloc(sl()));

    // sl.registerFactory(() => UserBloc(
    // createUserUseCase: sl(), loginUserCase: sl()));
    // Usecases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => CreateUserUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton(() => AuthenticationState(sl()));
    sl.registerLazySingleton(() => GetNewArrivalsUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDetailsUseCase(sl()));


    // Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseFoodRepository>(() => FoodsRepository(sl()));

    // sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    // Datasources

    sl.registerLazySingleton<BaseFoodRemoteDataSource>(
        () => FoodRemoteDataSource());

    sl.registerLazySingleton<BaseUserRemoteDateSource>(
        () => UserRemoteDataSource());
  }
}
