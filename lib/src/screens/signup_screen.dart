
import 'package:auth/src/models/signup.dart';
import 'package:auth/src/screens/login_screen.dart';
import 'package:auth/src/servies/api_service.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);
  

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 40,)),
                  SizedBox(height: 10,),
                  Text("Welcome On Quiz App",style: TextStyle(color: Colors.white,fontSize: 20,)),
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
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                                    hintText: "Enter FirstName",
                                    // labelText: "FirstName",
                                    hintStyle:TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    firstName = value;
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
                                    hintText: "Enter LastName",
                                    // labelText: "LastName",
                                    hintStyle:TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    lastName = value;
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
                                    hintText: "Enter Email",
                                    // labelText: "Email",
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
                                    // labelText: "Password",
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
                      SizedBox(height: 25,),
                      InkWell(
                        onTap: ()async{
                          print("Login");
                          if (_formKey.currentState!.validate()) {
                            var apiData = await ApiService().post("auth/signup", {
                              "firstName" : firstName,
                              "lastName" : lastName,
                              "email":email,
                              "password":password
                            });
                            print(apiData);
                            var data = Signup.fromJson(apiData);
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
                            child: Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("I have Account.",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 25,),
                      InkWell(
                        onTap: ()async{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue
                          ),
                          child: Center(
                            child: Text("LogIn",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      // SizedBox(height: 20,),
                      // Text("Continue with social media",style: TextStyle(color: Colors.grey,fontSize: 16),),
                      // SizedBox(height: 20,),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: InkWell(
                      //         onTap: (){
                      //           print("Git gubbbbb");
                      //         },
                      //         child: Container(
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(50),
                      //             color: Colors.blue
                      //           ),
                      //           child: Center(
                      //             child: Text("GitHub",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 30,),
                      //     Expanded(
                      //       child: InkWell(
                      //         onTap: (){},
                      //         child: Container(
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(50),
                      //             color: Colors.black
                      //           ),
                      //           child: Center(
                      //             child: Text("Gmail",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
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
//         appBar: AppBar(title: Text("SignUp")),
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
//                       textCapitalization: TextCapitalization.words,
//                       textAlignVertical: TextAlignVertical.center,
//                       decoration: InputDecoration(
//                         // prefixIcon: Icon(Icons.face),
//                         labelText: 'First Name',
//                         hintText: "Enter First Name",
//                         border: OutlineInputBorder()
//                       ),
//                       onChanged: (value){
//                         firstName = value;
//                       },
//                       validator: (value){
//                         if(value!.length<3){
//                           return "Invalid Name";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: TextFormField(
//                       autofocus: true,
//                       textCapitalization: TextCapitalization.words,
//                       textAlignVertical: TextAlignVertical.center,
//                       onChanged: (value){
//                         lastName = value;
//                       },
//                       decoration: InputDecoration(
//                         // prefixIcon: Icon(Icons.face),
//                         labelText: 'Last Name',
//                         hintText: "Enter Last Name",
//                         border: OutlineInputBorder()
//                       ),
//                     ),
//                   ),
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
//                       textCapitalization: TextCapitalization.words,
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
//                         if (_formKey.currentState!.validate()) {
//                           var apiData = await ApiService().post("auth/signup", {
//                             "firstName":firstName,
//                             "lastName":lastName,
//                             "email":email,
//                             "password":password
//                           });
//                           var dataaa = Signup.fromJson(apiData);
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(SnackBar(content: Text('${dataaa.message}')));
//                         }
//                       },
//                       child: Text('Signup'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                       },
//                       child: Text('Login'),
//                     ),
//                   ),
//                 ],
//               )
//             ),
//           )
//         )
//       ),