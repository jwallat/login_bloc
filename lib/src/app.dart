import "package:flutter/material.dart";
import "screens/login_screen.dart";

class App extends StatelessWidget {
  build(context) {
    return MaterialApp(
      title: "Log me in!",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
