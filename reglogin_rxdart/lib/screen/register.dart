import 'package:flutter/material.dart';
import 'package:reglogin_rxdart/bloc/login_bloc.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silahkan Daftar'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.0,),
                StreamBuilder<String>(
                  stream: loginBloc.nama,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: loginBloc.onChangeNama,
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama Lengkap',
                        labelText: 'Nama Lengkap',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0)
                        ),
                        errorText: snapshot.error
                      ),
                    );
                  }
                ),
                SizedBox(height: 8.0,),
                StreamBuilder<String>(
                  stream: loginBloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: loginBloc.onChangeEmail,
                      decoration: InputDecoration(
                          hintText: 'Masukan Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                        errorText: snapshot.error
                      ),
                    );
                  }
                ),
                SizedBox(height: 8.0,),
                StreamBuilder<String>(
                  stream: loginBloc.password,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: loginBloc.onChangePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Masukan Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                        errorText: snapshot.error
                      ),
                    );
                  }
                ),
                SizedBox(height: 8.0,),
                StreamBuilder<String>(
                  stream: loginBloc.telp,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: loginBloc.onChangeTelp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Masukan Nomor Handphone',
                          labelText: 'Handphone',
                          prefixIcon: Icon(Icons.phone_android),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                        errorText: snapshot.error
                      ),
                    );
                  }
                ),
                SizedBox(height: 8.0,),
                TextField(
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Masukan Alamat Lengkap',
                      labelText: 'Alamat',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      )
                  ),
                ),
                StreamBuilder<bool>(
                  stream: loginBloc.registerIsValid,
                  builder: (context, snapshot) {
                    return RaisedButton(
                      child: Text(
                        'Daftar', style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.cyan,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      ),
                      onPressed: snapshot.hasData ? loginBloc.register:null,
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
