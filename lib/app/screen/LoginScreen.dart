import 'package:calera/app/container/layout.dart';
import 'package:calera/app/container/mobile.dart';
import 'package:calera/firebase/resolvers/auth.dart';
import 'package:calera/styles/colors.dart';
import 'package:calera/utils/forms.dart';
import 'package:calera/utils/warningMessage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool iLoading = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void loginUser() async {
    setState(() {
      iLoading = true;
    });

    String res = await Auth().loginUser(
      email: email.text,
      password: password.text,
    );

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Layout(
            mobileLayout: MobileLayout(),
          ),
        ),
      );
    } else {
      warningMessage(
        alert: true,
        context: context,
        res: res,
      );
    }

    setState(() {
      iLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              SizedBox(
                height: 90.0,
                width: 300.0,
                child: Image.asset(
                  "assets/calera_icon.png",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Dirección de correo electrónico',
                        isDense: true,
                        contentPadding: const EdgeInsets.all(13),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.left,
                      obscureText: !_isPasswordVisible,
                      controller: password,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(13),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    iLoading
                        ? Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                              color: loadings,
                            ),
                            child: const Text(
                              'Iniciando sesión ...',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: lead),
                            ),
                          )
                        : InkWell(
                            onTap: loginUser,
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                color: button,
                              ),
                              child: const Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: white),
                              ),
                            )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
