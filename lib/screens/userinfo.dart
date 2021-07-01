import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key key}) : super(key: key);

  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Добавить новый адрес"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).accentColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      hintText: 'Введите имя',
                      labelText: "Имя",
                      prefixText: "",
                      suffixIcon: Icon(Icons.person_pin),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).accentColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      hintText: 'Введите фамилию',
                      labelText: "Фамилия",
                      suffixIcon: Icon(Icons.person_add),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).accentColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      hintText: 'Введите телефон',
                      labelText: "Телефон",
                      suffixIcon: Icon(Icons.mobile_screen_share),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).accentColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 1.0),
                        ),
                        hintText: 'Введите правильный адрес',
                        labelText: "Адрес",
                        suffixIcon: Icon(Icons.location_on)),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      focusColor: Theme.of(context).accentColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      hintText: 'Введите правильный адрес',
                      labelText: "Адрес",
                      suffixIcon: Icon(Icons.location_city),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).accentColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0),
                      ),
                      hintText: 'Введите правильный код',
                      labelText: "Код",
                      suffixIcon: Icon(Icons.chrome_reader_mode),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            )),
      ),
    );
  }
}
