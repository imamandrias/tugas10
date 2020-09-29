import 'package:reglogin_rxdart/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //tambahan untuk register
  final _namaController =BehaviorSubject<String>();
  final _telpController =BehaviorSubject<String>();


  //output Stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<String> get nama => _namaController.stream.transform(validateNama);
  Stream<String> get telp => _telpController.stream.transform(validateTelp);

  Stream<bool> get isValid => CombineLatestStream.combine2(email, password, (email, password) => true);
  Stream<bool> get registerIsValid => CombineLatestStream.combine4(email, password,nama, telp,
          (email, password, nama, alamat) => true);

  //even
  Function(String) get onChangeEmail =>_emailController.sink.add;
  Function(String) get onChangePassword =>_passwordController.sink.add;
  Function(String) get onChangeNama =>_namaController.sink.add;
  Function(String) get onChangeTelp =>_telpController.sink.add;
  //buat fungsi saat user mengklik tombol login
  void login(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Email is: $validEmail, and Password is $validPassword");
  }
  void register(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    final validNama = _namaController.value;
    final validTelp = _telpController.value;

    print("Email adalah $validEmail, Password adalah $validPassword, Nama adalah $validNama, dan Handphone adalah $validTelp");
  }

}

//inisialisasi
final loginBloc = LoginBloc();