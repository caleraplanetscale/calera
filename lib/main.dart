import 'package:calera/app/container/layout.dart';
import 'package:calera/app/container/mobile.dart';
import 'package:calera/app/screen/LoginScreen.dart';
import 'package:calera/firebase/provider/user.dart';
import 'package:calera/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await core.Firebase.initializeApp(
      options: const core.FirebaseOptions(
        apiKey: "AIzaSyDZDJcFAeGKOkXcSV3wMtkH2tkjE2Q6Wxs",
        authDomain: "calera-febrero-6.firebaseapp.com",
        projectId: "calera-febrero-6",
        storageBucket: "calera-febrero-6.appspot.com",
        messagingSenderId: "70668289855",
        appId: "1:70668289855:web:40f555ccb6ef70d1c7b58a",
        measurementId: "G-DPCD846WEX",
      ),
    );
  } else {
    await core.Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (e) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'calera',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, e) {
            if (e.connectionState == ConnectionState.active) {
              if (e.hasData) {
                return const Layout(
                  mobileLayout: MobileLayout(),
                );
              } else if (e.hasError) {
                return Center(
                  child: Text('${e.error}'),
                );
              }
            }

            if (e.connectionState == ConnectionState.waiting) {
              return Container(
                color: white,
                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: white,
                  ),
                ),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
