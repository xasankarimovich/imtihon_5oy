
import 'package:get_it/get_it.dart';

import 'firebase_auth_services.dart';

GetIt getIt = GetIt.instance;

void setUP(){
  getIt.registerFactory<FirebaseAuthService>(()=>FirebaseAuthService());
}