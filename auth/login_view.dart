import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

import '../import.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget{

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    ///логотип
    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top: 0),
        child: Container(
          child: Align(
            child: Image(image: AssetImage('images/logohome.png')),
          ),
        ),
      );
    }


    Widget _imput(String hint, TextEditingController controller, bool obsecure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 15, color: Colors.grey[500]),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.indigo), //изменяет цвет теста
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.blueGrey, width: 5),
            ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
              ),
            prefix: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
            ),
          ),
        ),
      );
    }

    Widget _button(String text, void func()){
      return RaisedButton(
        color: Colors.grey,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        onPressed: (){
          func();
        },
      );
    }

  /// форма входа
    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: _imput(email, _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: _imput(pass, _passwordController, true),
            ),
            ButtonTopVertical,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _loginButtonAction() async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim());
      if(user == null){
        Fluttertoast.showToast(
            msg: logintext,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _regButtonAction()async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.registerInWithEmailAndPassword(_email.trim(), _password.trim());
      if(user == null){
        Fluttertoast.showToast(
            msg: regtext,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else {
        _emailController.clear();
        _passwordController.clear();
      }
    }
/// Image(image: AssetImage('images/logohome.png')),

///это то что выводится на экране проекта
    return Scaffold(
      body: ListView(
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LoginTopVertical,
                  _logo(),
                  (
                      showLogin
                  ? Column(
                       children: <Widget>[
                         _form(openB, _loginButtonAction),
                         Padding(
                           padding: EdgeInsets.only(top: 12),
                           child: GestureDetector(
                             child: Text(
                                 onClick,
                               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                               onTap: (){
                               setState((){
                                 showLogin = false;
                           });
                           },
                           ),
                         ),
                       ],
                      )
                          :
                      Column(
                        children: <Widget>[
                          _form(regB, _regButtonAction),
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: GestureDetector(
                              child: Text(
                                  onClicb,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                              onTap: (){
                                setState((){
                                  showLogin = true;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: GestureDetector(
                      child: Text(forgPass, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      onTap: (){
                        
                      },
                    )
                  ),

                ],
              ),
            ),
        ],
      ),
    );
  }
}