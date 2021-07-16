
import 'package:auth/src/models/login.dart';
import 'package:auth/src/servies/api_service.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Center(
          child:SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Text('Enter information about PG Owner'),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      // textCapitalization: TextCapitalization.words,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (value){
                        email = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Enter Email',
                        hintText: "Enter Email",
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "This field is requied";
                        }
                        if(!value.contains('@')){
                          return "@ requied";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (value){
                        password = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Password',
                        hintText: "Enter Password",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var apiData = await ApiService().post("auth/login", {
                            "email":email,
                            "password":password
                          });
                          var dataaa = Login.fromJson(apiData);
                          print(" data ${dataaa.data}");
                          print("token ${dataaa.token}");
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('${dataaa.message}')));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              )
            ),
          )
        )
      ),
    );
  }
}
