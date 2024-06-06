import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Screens/loginpage.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  Sharedpreference sharedpreference = Sharedpreference();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width / 0.8,
      child: ElevatedButton(
          onPressed: () async {
            await sharedpreference.clearToken();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          child: Text("LOGOUT")),
    );
  }
}
