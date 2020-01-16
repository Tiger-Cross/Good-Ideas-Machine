import 'package:get_it/get_it.dart';
import 'package:good_ideas_machine/core/services/FirebaseDataManager.dart';
import 'package:good_ideas_machine/core/viewmodels/IdeasManager.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDataManager('ideas'));
  locator.registerLazySingleton(() => IdeasManager());
}