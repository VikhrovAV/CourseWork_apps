import 'package:flutter/material.dart';
import 'package:fluttercommerce/screens/login.dart';
import 'package:fluttercommerce/screens/verifynumber.dart';
import 'package:fluttercommerce/widgets/edittext.dart';
import 'package:fluttercommerce/widgets/submitbutton.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "PartsOnline",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    "Регистрация",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                EditText(title: "Имя"),
                EditText(title: "Фамилия"),
                EditText(title: "Email"),
                EditText(title: "Пароль"),
                SubmitButton(
                  title: "Зарегистрироваться",
                  act: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyScreeen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Уже есть аккаунт? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Войти",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
