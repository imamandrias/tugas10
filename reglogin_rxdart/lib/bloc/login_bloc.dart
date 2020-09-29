import 'package:reglogin_rxdart/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //tambahan untuk register


  //output Stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get isValid => CombineLatestStream.combine2(email, password, (email, password) => true);

  //even
  Function(String) get onChangeEmail =>_emailController.sink.add;
  Function(String) get onChangePassword =>_passwordController.sink.add;
  //buat fungsi saat user mengklik tombol login
  void login(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Email is: $validEmail, and Password is $validPassword");
  }
  void register(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Email is: $validEmail, and Password is $validPassword");
  }

}

//inisialisasi
final loginBloc = LoginBloc();