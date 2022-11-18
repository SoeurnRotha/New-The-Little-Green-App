import 'package:get_it/get_it.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Navigator_server/Navigator_server.dart';
GetIt location = GetIt.instance;

void setupLocation(){
  location.registerLazySingleton(() => Navigator_server());
}