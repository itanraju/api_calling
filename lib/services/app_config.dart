import 'package:api_calling/provider/authentication_provider.dart';
import 'package:get_it/get_it.dart';

GetIt appConfig = GetIt.I;

void setupAppConfig() {
  appConfig.registerLazySingleton(() => AuthenticationProvider());
}
