import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.googleAccount.value == null)
              return buildLoginButton();
            else
              print("null degil");
            return Container();
          },
        ),
      ),
    );
  }

  ElevatedButton buildLoginButton() {
    return ElevatedButton(
      child: Text("Log in"),
      onPressed: () => controller.login(),
    );
  }

  Column buildProfilePic() {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: Image.network("").image,
          radius: 50,
        ),
        Text(controller.googleAccount.value!.displayName.toString()),
        Text(controller.googleAccount.value!.email)
      ],
    );
  }
}

class LoginController extends GetxController {
  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await googleSignIn.signIn();
  }
}
