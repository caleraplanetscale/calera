import 'package:provider/provider.dart';
import 'package:calera/firebase/provider/user.dart';
import 'package:calera/firebase/schemas/user.dart' as model;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    print("user.name:${user}");
    return Scaffold(
      body: Container(
        child: Text(user.id.toString()),
      ),
    );
  }
}
