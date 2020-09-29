import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink){
    if(email.contains("@")){
      sink.add(email);
    }else{
      sink.addError("Ketik email anda dengan benar");
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink){
    if(password.length > 6){
    sink.add(password);
    }else{
    sink.addError("Password harus terdiri lebih dari 5 karakter");
    }
  });

  final validateNama = StreamTransformer<String, String>.fromHandlers(handleData: (nama, sink){
    if(nama.isEmpty){
      sink.addError("Silahkan Isi Nama Lengkap Anda");
    }else{
      sink.add(nama);
    }
  });

  final validateTelp = StreamTransformer<String, String>.fromHandlers(handleData: (telp, sink){
    RegExp regx = RegExp(r"^[0-9]*$",caseSensitive: false);
    if(!(regx.hasMatch(telp))){
      sink.add(telp);
    }else{
      sink.addError("Silahkan Isi dengan Angka Saja");
    }
  });
}