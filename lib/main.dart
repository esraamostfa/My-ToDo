import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:my_todo/data/api/user_auth/firebase_user_auth_api.dart';
import 'package:my_todo/shared/app.dart';
import 'package:my_todo/shared/app_repository.dart';

import 'data/api/task/firestore_task_api.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  AppRepository appRepository = AppRepository(userAuthApi: FireBaseUserAuthApi(),myToDoApi:  FirestoreTaskApi());

  runApp( MyToDoApp(appRepository: appRepository,));
}



