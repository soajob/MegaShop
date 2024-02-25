import 'package:get_it/get_it.dart';
import 'package:mega_shop/data/repositories/product_repository_impl.dart';
import 'package:mega_shop/domain/repositories/product_repository.dart';
import 'package:mega_shop/domain/usecases/get_all_products.dart';
import 'package:mega_shop/presentation/bloc/product_list_cubit/product_list_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  serviceLocator.registerFactory(
      () => ProductListCubit(getAllProducts: serviceLocator())
  );

  // UseCases
  serviceLocator.registerLazySingleton(() => GetAllProducts(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl()
  );
}
