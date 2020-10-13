import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print('Email: $email\n Senha: $password');
    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String newEmail) => email = newEmail;

  @observable
  String password = "";

  void setPassword(newPassword) => password = newPassword;

  @observable
  bool passwordVisible = false;

  @action
  void toggglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loggeIn = false;

  @action
  Future login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
    loggeIn = true;
    email ="";
    password = "";
  }

  @action
  void logout(){
    loggeIn = false;
  }

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  @computed
  bool get isEmailValid => email.length > 6;

  @computed
  bool get isPasswordValid => password.length > 6;
}

