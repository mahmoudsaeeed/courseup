import 'package:courseup/core/my_routes.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';

import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/Auth/data/repository/my_user_repo_impl.dart';
import 'package:courseup/features/Home/presentation/views/my_home_view.dart';
import 'package:courseup/features/Search/presentation/widgets/my_search_widget.dart';
import 'package:courseup/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/splash_screen/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(MyUserRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        onGenerateRoute: (settings) => MyRoutes.myRoutes(settings),

        // home: const SplashScreen(),
        home: const MyHomeView(user: MyUserEntity(userId: "5", email: "acc@gmail.com", name: "acc"),),
      ),
    );
  }
}
