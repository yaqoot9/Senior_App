import 'package:firebase_database/firebase_database.dart';
import 'package:firstapp/Login.dart';
import 'package:flutter/material.dart';
class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: registerpage(),
      ),

    );
  }
}
class registerpage extends StatefulWidget {
  const registerpage({Key? key}) : super(key: key);

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late String email;
  late String password;
  bool isSecure=true;
  static var Id=1;
  DatabaseReference dbref = FirebaseDatabase.instance.ref().child("Users/${Id}");



  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[350],
        child:Center(

          child: Stack(children: [
          Container(
          //margin: EdgeInsets.only(top:100),
          child: Image.asset('assets/Cover.jpg',  opacity: AlwaysStoppedAnimation(0.9),fit: BoxFit.cover),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,
            children: [
           Text("Create an account",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color:Colors.green[900],fontFamily: 'Dancing'),),
            Padding(padding: EdgeInsets.all(3)),
            Form(key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(constraints: BoxConstraints.tightFor(width: 300) ,
                    child:  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Name',
                        suffixIcon: Icon(Icons.person),

                      ),
                      validator: (val) {
                        if (val==null || val.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },

                    ),),

                  Padding(padding: EdgeInsets.all(5)),
                  ConstrainedBox(constraints: BoxConstraints.tightFor(width: 300) ,
                    child:  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'you@gmail.com',
                        suffixIcon: Icon(Icons.contact_mail),

                      ),
                      validator: (val) {
                        if (val==null || val.isEmpty) {
                          return "please enter your email";
                        }
                        return null;
                      },

                    ),),
                  Padding(padding: EdgeInsets.all(5)),
                  ConstrainedBox(constraints: BoxConstraints.tightFor(width: 300) ,
                    child:  TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'phone_Number',
                        suffixIcon: Icon(Icons.phone_android),

                      ),
                      validator: (val) {
                        if (val==null || val.isEmpty) {
                          return "please enter your phone";
                        }
                        return null;
                      },

                    ),),
                  Padding(padding: EdgeInsets.all(5)),
                  ConstrainedBox(constraints: BoxConstraints.tightFor(width: 300)
                    ,child:TextFormField(
                        controller: _passwordController,
                        obscureText: isSecure,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon:GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSecure=!isSecure;
                                });
                              },
                              child:Icon(isSecure? Icons.visibility: Icons.visibility_off)

                          ) ,

                          border:OutlineInputBorder(),
                          hintText: 'password',
                          labelText: 'password',

                        ),
                        validator: (String? val) {
                          if(val==null||val.isEmpty)
                            return "Please enter password";
                          else if (val.length<8){
                            return "Password should be more than 8";
                          }
                          else
                            return null;
                        }



                    ) ,),


                  Padding(padding: EdgeInsets.all(5)),
                  ConstrainedBox(constraints: BoxConstraints.tightFor(width: 300)
                    ,child:TextFormField(
                        controller: _cpasswordController,
                        obscureText: isSecure,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon:GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSecure=!isSecure;
                                });
                              },
                              child:Icon(isSecure? Icons.visibility: Icons.visibility_off)

                          ) ,

                          border:OutlineInputBorder(),
                          hintText: 'confirm password',
                          labelText: 'confirm password',

                        ),
                        validator: (String? val) {
                          if(val!=_passwordController.text)
                            return "Please enter correct password";

                          else
                            return null;
                        }



                    ) ,),
                  Padding(padding: EdgeInsets.all(5)),
                  ConstrainedBox(constraints:  BoxConstraints.tightFor(width: 200),child:   ElevatedButton(
                      style:ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[900]!)),
                      onPressed:()async{
                        if(_formKey.currentState!.validate()){
                          await dbref.set({
                            'name':_nameController.text,
                            'email':_emailController.text,
                            'password':_passwordController.text,
                            'phone':_phoneController.text,

                          });
                          Id=Id+1;
                          Navigator.pushNamed(context,'/LoginPage',);
                        }



                      }, child: Text('register')
                  ), ),

                  TextButton(child: Text("Already have an account ? Sign in",style: TextStyle(color:Colors.green[900]),),onPressed: () => Navigator.pushNamed(context,'/LoginPage',))
                ],
              )
              ,)

          ],
          ),
        )])));
  }
}
