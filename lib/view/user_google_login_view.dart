import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_integration_practice/util/helper.dart';
import 'package:system_integration_practice/viewmodel/user_google_login_viewmodel.dart';

class UserGoogleLoginView extends StatefulWidget {
  const UserGoogleLoginView({super.key});

  @override
  State<UserGoogleLoginView> createState() => _UserGoogleLoginViewState();
}

class _UserGoogleLoginViewState extends State<UserGoogleLoginView> {
  late UserGoogleLoginViewModel _userGoogleLoginViewModelReader;
  late UserGoogleLoginViewModel _userGoogleLoginViewModelWatcher;

  @override
  Widget build(BuildContext context) {
    _userGoogleLoginViewModelReader = context.read<UserGoogleLoginViewModel>();
    _userGoogleLoginViewModelWatcher =
        context.watch<UserGoogleLoginViewModel>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: _googleSignIn, child: const Text('Google Sign-in')),
      ),
    );
  }

  void _googleSignIn(){
    try {
      _userGoogleLoginViewModelReader.googleSignIn();
    } catch(error){
      showToast(context, error.toString());
    }
  }
}
