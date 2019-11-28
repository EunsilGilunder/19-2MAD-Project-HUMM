import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:myhumm/home.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9"),
            // TextField(
            //   controller: emailController,
            // ),
            // TextField(
            //   controller: passwordController,
            // ),
            // FlatButton(
            //     onPressed: () {},
            //     child: Text("click me"),
            //     color: Colors.blueGrey),
            Divider(
              color: Colors.blueGrey,
            ),
            RaisedButton(
              child: Text(
                "sign in w/ google",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                String result = await signinWithGoogle();
                if (result == null) print("error");
              },
            )
          ],
        ),
      ),
    );
  }
}

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("LOGIN YESYEYSYEYSEYSYEYSEYSYEYES"),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Divider(
//               color: Colors.blueGrey,
//             ),
//             RaisedButton(
//               child: Text(
//                 "sign in w/ google",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () async {
//                 final GoogleSignInAccount googleSignInAccount =
//                     await googleSignIn.signIn();
//                 final GoogleSignInAuthentication googleSignInAuthentication =
//                     await googleSignInAccount.authentication;
//                 final AuthCredential credential =
//                     GoogleAuthProvider.getCredential(
//                   accessToken: googleSignInAuthentication.accessToken,
//                   idToken: googleSignInAuthentication.idToken,
//                 );
//                 final FirebaseUser user =
//                     (await firebaseAuth.signInWithCredential(credential)).user;
//                 print(user.email);
//                 print(user.uid);
//                 Global.currentUser = await firebaseAuth.currentUser();
//                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (_) => HomePage()));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
