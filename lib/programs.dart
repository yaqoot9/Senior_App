import 'package:flutter/material.dart';

class programmsPage extends StatelessWidget {
  const programmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body:Myprogram(),),);
  }
}

class Myprogram extends StatefulWidget {
  const Myprogram({Key? key}) : super(key: key);

  @override
  State<Myprogram> createState() => _MyprogramState();
}

class _MyprogramState extends State<Myprogram> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,);
  }
}

