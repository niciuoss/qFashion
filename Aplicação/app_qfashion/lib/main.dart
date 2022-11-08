import 'package:app_qfashion/models/product_manager.dart';
import 'package:app_qfashion/models/user_manager.dart';
import 'package:app_qfashion/screens/login/login_screen.dart';
import 'package:app_qfashion/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/base/base_screen.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
  //FirebaseFirestore.instance.collection('usuarios').add({'usuario':'Usuario'});
  // FirebaseFirestore.instance
  //     .collection('usuarios')
  //     .doc('XiuMe9Sf2vC0QHUQFnv9')
  //     .snapshots()
  //     .listen((doc) {
  //   print(doc.data());
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'App qFashion',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 0, 75, 100),
          scaffoldBackgroundColor: const Color.fromARGB(255, 33, 33, 33),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: const Color.fromARGB(255, 0, 75, 100)
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        onGenerateRoute: (settings){
          switch(settings.name){
            case'/login':
              return MaterialPageRoute(
                  builder: (_)=> LoginScreen()
              );
            case'/base':
              return MaterialPageRoute(
                  builder: (_)=> BaseScreen()
              );
            case'/signup':
              return MaterialPageRoute(
                  builder: (_)=> SignUpScreen()
              );
            default:
              return MaterialPageRoute(
                  builder: (_)=> LoginScreen()
              );
          }
        },
        // home: BaseScreen(),
      ),
    );
  }
}

