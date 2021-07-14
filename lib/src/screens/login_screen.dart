
import 'package:auth/src/servies/api_service.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("Login Screen")),
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
                      onTap: () {},
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Enter Name',
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      textAlignVertical: TextAlignVertical.center,
                      onTap: () {},
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Enter Email',
                        hintText: "Enter Your Email",
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
                      onTap: () {},
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: 'Password',
                        hintText: "Enter Your Password",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length < 9) {
                        return 'Phone number must be 9 digits or longer';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Phone number',
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        post();
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(SnackBar(content: Text('Processing Data')));
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
