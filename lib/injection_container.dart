import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_qutoe/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_qutoe/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_qutoe/data/repositories/quote_repository_impl.dart';
import 'package:quotes/features/random_qutoe/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_qutoe/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_qutoe/presenation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  //Use Cases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepositorty: sl()));

  //Repository
  sl.registerLazySingleton<QuoteRepositorty>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteLocalDataSource: sl(),
      randomQuoteRemoteDataSource: sl()));

  //Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
