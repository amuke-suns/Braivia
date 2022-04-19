import 'package:braivia/services/web_api/web_api_fake.dart';
import 'package:braivia/services/web_api/web_api_impl.dart';
import 'package:get_it/get_it.dart';

import 'web_api/web_api.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
}
