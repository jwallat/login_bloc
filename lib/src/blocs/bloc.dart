import "dart:async";
import "validators.dart";
import "package:rxdart/rxdart.dart";

class Bloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Valid email: " + validEmail);
    print("Valid password: " + validPassword);
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
