import 'package:courseup/core/myObservable/my_cubit_observable.dart';
import 'package:courseup/core/my_routes.dart';

import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/Auth/data/repository/my_user_repo_impl.dart';
import 'package:courseup/features/splash_screen/splash_screen.dart';
import 'package:courseup/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Bloc.observer = MyCubitObservable();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(MyUserRepoImpl())..checkAuthStatus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        onGenerateRoute: (settings) => MyRoutes.myRoutes(settings),

        home: const SplashScreen(),
        // home: const MyCreateCourseView(),
      ),
    );
  }
}
