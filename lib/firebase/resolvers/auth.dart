import 'package:calera/firebase/schemas/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<model.User> getUserDetails() async {
    User docUser = auth.currentUser!;
    print("doc: ${docUser}");

    DocumentSnapshot doc =
        await firestore.collection('user').doc(docUser.uid).get();
    return model.User.fromSnap(doc);
  }

  Future<String> signUpUser({
    required String? areaId,
    required String email,
    required String password,
    required String name,
  }) async {
    String res = 'Ocurrió algún error';
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        model.User user = model.User(
          name: name,
          id: cred.user!.uid,
          email: email,
          password: password,
        );

        await firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';
      } else {
        res = 'Complete los campos';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Ocurrió algún error'; // Mensaje predeterminado

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'Complete los campos';
      }
    } catch (error) {
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'user-not-found':
            res = 'Usuario no encontrado';
            break;
          case 'wrong-password':
            res = 'Contraseña incorrecta';
            break;
          case 'invalid-email':
            res = 'Correo electrónico inválido';
            break;
          default:
            res = 'Error de autenticación: ${error.code}';
            break;
        }
      } else {
        res = 'Error de autenticación: ${error.toString()}';
      }
    }
    return res;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
