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
}