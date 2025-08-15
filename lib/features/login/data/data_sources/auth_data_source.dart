import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthDataSource {
  Future<String> signInGoogle();
}

class AuthDataSourceImpl implements AuthDataSource {

  @override
  Future<String> signInGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(scopes: ['email']);
      final account = await googleSignIn.signIn();
      if(account == null) {
        throw Exception('sign in with Google canceled');
      }
      return account.email;
    } catch (e) {
      throw Exception('Failed to sign in with Google: ${e.toString()}');
    }
  }
}
