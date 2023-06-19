import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstapp/Register.dart';
import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/RegisterPage': (BuildContext context) =>   register(),
        '/HomePage': (BuildContext context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String password;
  bool isSecure = true;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/Cover.jpg',
              opacity: AlwaysStoppedAnimation(0.9),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "    Login",
                    style: TextStyle(
                      fontSize: 65,
                      fontFamily: 'Dancing',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 300),
                    child: TextFormField(
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
                        if (val == null || val.isEmpty) {
                          return "please enter your email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 300),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: isSecure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSecure = !isSecure;
                            });
                          },
                          child: Icon(isSecure ? Icons.visibility : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'password',
                        labelText: 'password',
                      ),
                      validator: (String? val) {
                        if (val == null || val.isEmpty)
                          return "Please enter password";
                        else if (val.length < 8) {
                          return "Password should be more than 8";
                        } else
                          return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1)),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 230),
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the desired background color
                        // You can also customize other properties such as padding, shape, etc.
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('User');

                            // Query the Realtime Database to find the user with the provided email
                            DatabaseEvent event = await dbRef.orderByChild('email').equalTo(_emailController.text.trim()).once();
                            dynamic snapshotValue = event.snapshot.value;
                            if (snapshotValue != null) {
                              // User with the provided email exists in the database
                              Map<dynamic, dynamic> users = snapshotValue as Map<dynamic, dynamic>;
                              String userId = users.keys.first;

                              // Retrieve the user's password from the database
                              String emailFromDatabase=users[userId]['email'];
                              print(emailFromDatabase);
                              String passwordFromDatabase = users[userId]['password'];
                              print(passwordFromDatabase);
                              if (passwordFromDatabase == _passwordController.text.trim()) {
                                // Email and password match, sign in the user
                                try {
                                  /* await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailFromDatabase,
                                    password: passwordFromDatabase,
                                  );*/
                                  Navigator.pushNamed(context, '/HomePage');
                                } catch (e) {
                                  print(e.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Authentication failed. Please try again.'),
                                    ),
                                  );
                                }
                              } else {
                                // Password does not match
                                print('Incorrect password');
                              }
                            } else {
                              // User with the provided email does not exist
                              print('User not found');
                            }
                          } catch (e) {
                            print(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Authentication failed. Please try again.'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19,color:Colors.green[900]),
                      ),
                    ),




                  ),
                  TextButton(
                    child: Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/RegisterPage'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}