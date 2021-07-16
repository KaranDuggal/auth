
import 'package:auth/src/models/signup.dart';
import 'package:auth/src/servies/api_service.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);
  

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var firstName = '';
  var lastName = '';
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("SignUp")),
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
                      textCapitalization: TextCapitalization.words,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'First Name',
                        hintText: "Enter First Name",
                        border: OutlineInputBorder()
                      ),
                      onChanged: (value){
                        firstName = value;
                      },
                      validator: (value){
                        if(value!.length<3){
                          return "Invalid Name";
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
                        lastName = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Last Name',
                        hintText: "Enter Last Name",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
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
                          var apiData = await ApiService().post("auth/signup", {
                            "firstName":firstName,
                            "lastName":lastName,
                            "email":email,
                            "password":password
                          });
                          var dataaa = Signup.fromJson(apiData);
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
