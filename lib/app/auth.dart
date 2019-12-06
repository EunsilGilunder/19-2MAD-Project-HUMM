import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String displayName;
String uid;
String email;
String imageUrl;

Future<String> signinWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(user.displayName != null);
  assert(user.email != null);
  assert(user.uid != null);
  assert(user.photoUrl != null);

  displayName = user.displayName;
  uid = user.uid;
  email = user.email;
  imageUrl = user.photoUrl;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return "signInWithGoogle succeeded: $user";
}

void signOut() async {
  try {
    await _auth.signOut();
    displayName = null;
    uid = null;
    email = null;
    imageUrl = null;
  } catch (e) {
    print("error logging out");
  }
  await _auth.signOut();
}
