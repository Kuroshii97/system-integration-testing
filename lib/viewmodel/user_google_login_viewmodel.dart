import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserGoogleLoginViewModel extends ChangeNotifier {
  GoogleSignInAccount? currentUser;
  bool isAuthorized = false;
  final List<String> _scopes = <String>[
    'email',
  ];

  void googleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: _scopes
      );
      await googleSignIn.signIn();
      isAuthorized = await googleSignIn.requestScopes(_scopes);
      notifyListeners();
    } catch (error) {
      rethrow;
    }

  }

}