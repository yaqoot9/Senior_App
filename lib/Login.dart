import 'package:firstapp/Register.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/RegisterPage':(BuildContext context) =>register(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: login(),
      ),
    );
  }
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String password;
  bool isSecure=true;
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.lime[100],
child:Center(
      child: Column(children: [
        Container(width: 500
          ,height: 200,
          child: Image.asset('assets/plantCover.jpg',),),
       Padding(padding: EdgeInsets.all(7)),
        Form(key: _formKey,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              Padding(padding: EdgeInsets.all(10),),
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
  Padding(padding: EdgeInsets.only(top: 8)),
  ConstrainedBox(constraints:  BoxConstraints.tightFor(width: 290),child:   ElevatedButton(
      style:ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[900]!)),
      onPressed:(){
        if(_formKey.currentState!.validate()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(password)));
        }
      }, child: Text('login')
  ), ),

              TextButton(child: Text("Dont have an account ? Sign up",style: TextStyle(color: Colors.black),),onPressed: () => Navigator.pushNamed(context,'/RegisterPage',))
            ],
          )
          ,)

      ],
      ),
));
  }
}

