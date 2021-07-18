
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
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        // padding: EdgeInsets.symmetric(
        //   vertical: 0,
        //   // horizontal: 54
        // ),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",style: TextStyle(color: Colors.white,fontSize: 40,)),
                  SizedBox(height: 10,),
                  Text("Welcome back",style: TextStyle(color: Colors.white,fontSize: 20,)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:Radius.circular(60))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, 0.3),
                              blurRadius: 20,
                              offset:Offset(0,10)
                            )
                          ]
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                  )
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    hintStyle:TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    email = value;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                  )
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    hintStyle:TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    password = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text("Forget password?",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 40,),
                      InkWell(
                        onTap: ()async{
                          print("Login");
                          if (_formKey.currentState!.validate()) {
                            var apiData = await ApiService().post("auth/login", {
                              "email":email,
                              "password":password
                            });
                            print(apiData);
                            var data = Login.fromJson(apiData);
                            print(data);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data.message}')));
                          }
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange.shade900
                          ),
                          child: Center(
                            child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Continue with social media",style: TextStyle(color: Colors.grey,fontSize: 16),),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                print("Git gubbbbb");
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("GitHub",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black
                                ),
                                child: Center(
                                  child: Text("Gmail",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}



// WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(title: Text("Login")),
//         body: Center(
//           child:SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   // Text('Enter information about PG Owner'),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: TextFormField(
//                       autofocus: true,
//                       keyboardType: TextInputType.emailAddress,
//                       // textCapitalization: TextCapitalization.words,
//                       textAlignVertical: TextAlignVertical.center,
//                       onChanged: (value){
//                         email = value;
//                       },
//                       decoration: InputDecoration(
//                         // prefixIcon: Icon(Icons.face),
//                         labelText: 'Enter Email',
//                         hintText: "Enter Email",
//                         border: OutlineInputBorder()
//                       ),
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return "This field is requied";
//                         }
//                         if(!value.contains('@')){
//                           return "@ requied";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: TextFormField(
//                       autofocus: true,
//                       // textCapitalization: TextCapitalization.words,
//                       textAlignVertical: TextAlignVertical.center,
//                       onChanged: (value){
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         // prefixIcon: Icon(Icons.face),
//                         labelText: 'Password',
//                         hintText: "Enter Password",
//                         border: OutlineInputBorder()
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
                        // if (_formKey.currentState!.validate()) {
                        //   var apiData = await ApiService().post("auth/login", {
                        //     "email":email,
                        //     "password":password
                        //   });
                        //   print(apiData);
                        //   var data = Login.fromJson(apiData);
                        //   print(data);
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(SnackBar(content: Text('${data.message}')));
                        // }
//                       },
//                       child: Text('Login'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
//                       },
//                       child: Text('Signup'),
//                     ),
//                   ),
//                 ],
//               )
//             ),
//           )
//         )
//       ),
//     );